import 'package:pivot/src/formatters/value_formatter.dart';

class TextValueFormatter implements ValueFormatter<Object> {
  const TextValueFormatter();

  @override
  String getText(Object value) {
    return value?.toString() ?? '';
  }
}
