part of "../../flutter_face_api.dart";

class Font {
  /// Font family.
  ///
  /// Beware that Android and iOS have diffrent font names,
  /// so you will have to use if condition.
  String get name => _name;
  String _name;

  /// Font size.
  int? get size => _size;
  int? _size;

  /// Font style.
  ///
  /// Android only.
  FontStyle? get style => _style;
  FontStyle? _style;

  Font(String name, {int? size, FontStyle? style})
    : _name = name,
      _size = size,
      _style = style;

  /// Allows you to deserialize object.
  static Font? fromJson(jsonObject) {
    if (jsonObject == null) return null;

    var result = Font(jsonObject["name"]);
    result._size = jsonObject["size"];
    result._style = FontStyle.getByValue(jsonObject["style"]);

    return result;
  }

  /// Allows you to serialize object.
  Map<String, dynamic> toJson() =>
      {"name": name, "size": size, "style": style?.value}.clearNulls();
}

enum FontStyle {
  /// Will be returned if [getByValue] if a non-existent was passed.
  UNKNOWN(-1),

  NORMAL(0),

  BOLD(1),

  ITALIC(2),

  BOLD_ITALIC(3);

  const FontStyle(this.value);
  final int value;

  static FontStyle? getByValue(int? i) {
    if (i == null) return null;
    try {
      return FontStyle.values.firstWhere((x) => x.value == i);
    } catch (_) {
      return FontStyle.UNKNOWN;
    }
  }
}
