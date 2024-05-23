import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

import 'nullable.dart';

Future<void> writeJson(String name, Map<String, dynamic> contents) async {
  var file = File("test/json/" + name + ".json");
  var jsonDir = Directory.fromUri(Uri(path: "test/json"));
  if (!await jsonDir.exists()) jsonDir.create();
  await file.writeAsString(jsonEncode(contents));
}

@isTest
void compare<T>(
    String name, Map<String, dynamic> json, T Function(dynamic) fromJson) {
  test(name, () async {
    var toJson = (input) => input.toJson();
    var actual = toJson(fromJson(json));
    expect(json, actual);
    await writeJson(name, json);

    var nullable = nullableMap[name];
    bool invert = nullableMap[name + "!"] != null;
    if (invert) nullable = nullableMap[name + "!"];
    if (nullable != null) {
      Map<String, dynamic> copy = {};
      if (!invert) {
        copy = toJson(fromJson(json));
        for (String item in nullable) {
          copy.remove(item);
        }
      } else {
        for (String item in nullable) {
          copy[item] = json[item];
        }
      }
      var actual = toJson(fromJson(copy));
      expect(copy, actual);
      writeJson(name + "Nullable", copy);
    }
  });
}

@isTest
void compareParams<T>(
    String name, Map<String, dynamic> json, T Function(dynamic) fromJson,
    {List<String>? skip}) {
  test(name, () {
    var toJson = (input) => input.toJson();
    var getTestSetters = (input) => input.testSetters;
    var object = fromJson(json);
    var actual = toJson(object);
    var testSetters = getTestSetters(object);
    if (skip != null) {
      for (String item in skip) {
        (actual as Map<String, dynamic>).remove(item);
        (testSetters as Map<String, dynamic>).remove(item);
      }
    }
    expect(json, actual);
    expect(json, testSetters);
    writeJson(name, json);
  });
}
