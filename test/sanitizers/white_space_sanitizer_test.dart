import 'package:pivot/src/sanitizers/white_space_sanitizer.dart';
import 'package:test/test.dart';

void main() {
  WhiteSpaceSanitizer sanitizer = new WhiteSpaceSanitizer();

  test('should not change empty strings', () {
    expect(sanitizer.sanitize(''), equals(''));
  });

  test('should replace whitespace with regular spaces but not new lines', () {
    expect(sanitizer.sanitize(' \t\n\f '), equals('  \n  '));
  });

  test('should replace unicode spaces with regular spaces but not new lines', () {
    expect(sanitizer.sanitize('\u00a0\u180e\n\u2003'), equals('  \n '));
  });
}
