import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  SelfValueProvider provider = new SelfValueProvider();

  test('should return element as value', () {
    expect(provider.getValue('text'), 'text');
  });

  test('should return null element as null value', () {
    expect(provider.getValue(null), null);
  });
}
