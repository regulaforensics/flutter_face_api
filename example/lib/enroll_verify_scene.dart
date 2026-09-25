import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:path_provider/path_provider.dart';

const _defaultServiceUrl = 'http://192.168.0.70:41101';

class EnrollVerifyScene extends StatefulWidget {
  const EnrollVerifyScene({super.key});

  @override
  State<EnrollVerifyScene> createState() => _EnrollVerifySceneState();
}

class _EnrollVerifySceneState extends State<EnrollVerifyScene> {
  final _url = TextEditingController(text: _defaultServiceUrl);
  final _name = TextEditingController();
  final _personId = TextEditingController();
  final _externalId = TextEditingController();
  final _groupId = TextEditingController();
  final _verifyId = TextEditingController();
  final _db = FaceSDK.instance.personDatabase;
  final _sdk = FaceSDK.instance;
  Map<String, dynamic>? _profile;
  List<PersonGroup> _groups = [];
  bool _usePersonId = true, _enrollByPerson = true, _enrollByExternal = true;
  bool _busy = false;
  String _status = 'Profile absent', _result = '';

  @override
  void initState() {
    super.initState();
    _applyUrl();
  }

  @override
  void dispose() {
    for (final c in [_url, _name, _personId, _externalId, _groupId, _verifyId]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<File> get _storage async =>
      File('${(await getApplicationSupportDirectory()).path}/enroll_verify_profiles.json');

  Future<void> _applyUrl() async {
    final url = _url.text.trim();
    _sdk.serviceUrl = url;
    final file = await _storage;
    if (await file.exists()) {
      try {
        _profile = (jsonDecode(await file.readAsString()) as Map<String, dynamic>)[url] as Map<String, dynamic>?;
      } catch (_) {
        _profile = null;
      }
    } else {
      _profile = null;
    }
    if (mounted) setState(() => _status = _profile == null ? 'Profile absent' : 'Profile saved');
  }

  String _livenessError(LivenessResponse response) {
    final error = response.error;
    if (error == null) return '';
    final backend = error.underlyingError;
    return backend == null
        ? 'SDK ${error.code.name} (${error.code.value}): ${error.message}'
        : 'SDK ${error.code.name} (${error.code.value}): ${error.message}; backend ${backend.code.name} (${backend.code.value}): ${backend.message}';
  }

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _result = '';
    });
    try {
      await action();
    } catch (e) {
      if (mounted) {
        setState(() {
          _status = 'SDK error';
          _result = e.toString();
        });
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _loadGroups() async {
    _sdk.serviceUrl = _url.text.trim();
    final (list, error) = await _db.getGroups();
    if (error != null) throw Exception(error);
    setState(() => _groups = list.items ?? []);
  }

  Future<void> _createGroup() async {
    final name = TextEditingController();
    final value = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create group'),
        content: TextField(
          controller: name,
          decoration: const InputDecoration(labelText: 'Group name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, name.text.trim()), child: const Text('Create')),
        ],
      ),
    );
    name.dispose();
    if (value == null || value.isEmpty) return;
    final (group, error) = await _db.createGroup(value);
    if (error != null || group == null) throw Exception(error ?? 'Group creation returned no group');
    await _loadGroups();
    setState(() => _groupId.text = group.id);
  }

  Future<void> _enroll() async => _run(() async {
    _sdk.serviceUrl = _url.text.trim();
    final groups = _groupId.text.trim().isEmpty ? <String>[] : [_groupId.text.trim()];
    final person = Person()
      ..name = _name.text.trim()
      ..id = _enrollByPerson ? _personId.text.trim() : ''
      ..externalId = _enrollByExternal ? _externalId.text.trim() : ''
      ..groups = groups;
    final config = EnrollmentConfig(
      person: person,
      searchFilter: SearchPersonFilter(groups: groups, threshold: 0.8),
      livenessType: LivenessType.PASSIVE,
      closeButtonEnabled: false,
    );
    setState(() => _status = 'Enrolling');
    final (live, response) = await _sdk.startEnrollment(config);
    final error = _livenessError(live);
    final enrolled = response?.enrolled == true && error.isEmpty;
    if (enrolled) {
      final p = response!.person;
      final next = <String, dynamic>{
        'personId': p?.id ?? (_enrollByPerson ? _personId.text.trim() : ''),
        'externalId': p?.externalId ?? (_enrollByExternal ? _externalId.text.trim() : ''),
        'groupIds': p?.groups ?? groups,
      };
      final file = await _storage;
      Map<String, dynamic> all = {};
      if (await file.exists()) {
        try {
          all = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
        } catch (_) {}
      }
      all[_url.text.trim()] = next;
      await file.writeAsString(jsonEncode(all));
      _profile = next;
      _status = 'Enrollment completed';
    } else {
      _status = error.isNotEmpty ? 'SDK error' : 'Enrollment failed';
    }
    setState(
      () => _result =
          'isEnrolled: ${response?.enrolled ?? false}\n'
          'personId: ${response?.person?.id ?? '-'}\nexternalId: ${response?.person?.externalId ?? '-'}\n'
          'groupId: ${(response?.person?.groups ?? const <String>[]).join(', ').ifEmpty('-')}\n'
          'liveness: ${live.liveness.name}${error.isEmpty ? '' : '\n$error'}',
    );
  });

  Future<void> _verify() async => _run(() async {
    _sdk.serviceUrl = _url.text.trim();
    final id = _verifyId.text; // Send unknown and empty values to the SDK as requested.
    final config = _usePersonId
        ? VerificationConfig.withPersonId(id, livenessType: LivenessType.PASSIVE, closeButtonEnabled: false)
        : VerificationConfig.withExternalId(id, livenessType: LivenessType.PASSIVE, closeButtonEnabled: false);
    setState(() => _status = 'Verifying');
    final (live, response) = await _sdk.startVerification(config);
    final error = _livenessError(live);
    setState(() {
      _status = error.isNotEmpty
          ? 'SDK error'
          : response?.verified == true
          ? 'Verify successful'
          : 'Verify failed';
      _result =
          'isVerified: ${response?.verified ?? false}\n'
          'similarity: ${response?.match?.similarity ?? '-'}\nmatch result: ${response?.match?.verified ?? '-'}\n'
          'liveness: ${live.liveness.name}${error.isEmpty ? '' : '\n$error'}';
    });
  });

  void _fillSavedId() => _verifyId.text = (_profile?[_usePersonId ? 'personId' : 'externalId'] as String?) ?? '';
  Widget _field(String label, TextEditingController c) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: c,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    ),
  );
  Widget _profileSummary() {
    final groups = (_profile?['groupIds'] as List<dynamic>?)?.join(', ') ?? '';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          _profile == null
              ? 'Profile absent'
              : 'personId: ${_profile?['personId'] ?? ''}\nexternalId: ${_profile?['externalId'] ?? ''}\ngroupId: $groups',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Enroll & Verify')),
    body: SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Expanded(child: TabBarView(children: [_form(enroll: true), _form(enroll: false)])),
            const TabBar(
              tabs: [
                Tab(text: 'Enroll'),
                Tab(text: 'Verify'),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget _form({required bool enroll}) => ListView(
    padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
    children: [
      _profileSummary(),
      _field('Service URL', _url),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(onPressed: _applyUrl, child: const Text('Apply URL')),
      ),
      if (enroll) ...[
        _field('name', _name),
        _field('personId', _personId),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => setState(() => _personId.text = _uuid()),
            child: const Text('Generate personId UUID'),
          ),
        ),
        _field('externalId', _externalId),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => setState(() => _externalId.text = _uuid()),
            child: const Text('Generate externalId UUID'),
          ),
        ),
        _field('groupId', _groupId),
        Wrap(
          spacing: 6,
          children: [
            OutlinedButton(onPressed: () => _run(_loadGroups), child: const Text('Load groups')),
            OutlinedButton(onPressed: () => _run(_createGroup), child: const Text('Create group')),
          ],
        ),
        if (_groups.isNotEmpty)
          DropdownButtonFormField<String>(
            initialValue: _groups.any((g) => g.id == _groupId.text) ? _groupId.text : null,
            decoration: const InputDecoration(labelText: 'Existing group'),
            items: _groups
                .map(
                  (g) => DropdownMenuItem(
                    value: g.id,
                    child: Text('${g.name} (${g.id})', overflow: TextOverflow.ellipsis),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => _groupId.text = v ?? ''),
          ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Enroll by personId'),
          value: _enrollByPerson,
          onChanged: (v) => setState(() => _enrollByPerson = v ?? false),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Enroll by externalId'),
          value: _enrollByExternal,
          onChanged: (v) => setState(() => _enrollByExternal = v ?? false),
        ),
      ] else ...[
        SegmentedButton<bool>(
          segments: const [
            ButtonSegment(value: true, label: Text('personId')),
            ButtonSegment(value: false, label: Text('externalId')),
          ],
          selected: {_usePersonId},
          onSelectionChanged: (values) => setState(() {
            _usePersonId = values.first;
            _verifyId.clear();
          }),
        ),
        _field(_usePersonId ? 'personId (unknown/empty allowed)' : 'externalId (unknown/empty allowed)', _verifyId),
        TextButton(onPressed: _fillSavedId, child: const Text('Use saved profile ID')),
      ],
      FilledButton(
        onPressed: _busy
            ? null
            : enroll
            ? _enroll
            : _verify,
        child: Text(
          _busy
              ? 'Working…'
              : enroll
              ? 'Enroll'
              : 'Verify',
        ),
      ),
      const SizedBox(height: 10),
      Text('Status: $_status', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
      if (_result.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 8), child: SelectableText(_result)),
    ],
  );
}

String _uuid() {
  final random = Random.secure();
  final b = List<int>.generate(16, (_) => random.nextInt(256));
  b[6] = (b[6] & 0x0f) | 0x40;
  b[8] = (b[8] & 0x3f) | 0x80;
  final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}-${h.substring(16, 20)}-${h.substring(20)}';
}

extension on String {
  String ifEmpty(String value) => isEmpty ? value : this;
}
