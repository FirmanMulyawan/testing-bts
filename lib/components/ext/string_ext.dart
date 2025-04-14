extension StringExt on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension StringNullable on String? {
  String toStringDefault() {
    return this ?? "-";
  }
}
