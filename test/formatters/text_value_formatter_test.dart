import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  TextValueFormatter formatter = new TextValueFormatter();

  test('should format passed test as string', () {
    expect(formatter.getText('text'), 'text');
  });

  test('should format passed number as string', () {
    expect(formatter.getText(42), '42');
  });

  test('should format null value as empty string', () {
    expect(formatter.getText(null), '');
  });
}