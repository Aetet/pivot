import 'dart:convert';

import 'package:pivot/src/encoders/value_encoder.dart';

class HtmlValueEncoder implements ValueEncoder<Object> {
  static final HtmlEscape _encoder = new HtmlEscape();

  const HtmlValueEncoder();

  @override
  String getHtml(Object value, String text) {
    return _encoder.convert(text);
  }
}
