import 'package:pivot/src/providers/key_value_provider.dart';
import 'package:test/test.dart';

void main() {
  KeyValueProvider provider = new KeyValueProvider('id');

  test('should extract value by key', () {
    expect(provider.getValue({'id': 1}), equals(1));
  });

  test('should extract null value by key', () {
    expect(provider.getValue({'id': null}), null);
  });

  test('should extract missing value as null by key', () {
    expect(provider.getValue({'title': 'text'}), null);
  });

  test('should extract missing value as null on missing element', () {
    expect(provider.getValue(null), null);
  });
}
