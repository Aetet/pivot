import 'package:pivot/src/sanitizers/value_sanitizer.dart';

class WhiteSpaceSanitizer implements ValueSanitizer {
  static final RegExp _whiteSpacePattern = new RegExp('[^\\S\n]');

  const WhiteSpaceSanitizer();

  @override
  String sanitize(String text) {
    return text.replaceAll(_whiteSpacePattern, ' ');
  }
}
