import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  MultiKeyValueProvider provider = new MultiKeyValueProvider(['fields', 'id']);

  test('should extract value by key path', () {
    expect(provider.getValue({'fields': {'id': 1}}), 1);
  });

  test('should extract null value by key', () {
    expect(provider.getValue({'fields': {'id': null}}), null);
  });

  test('should extract missing value as null by key', () {
    expect(provider.getValue({'fields': {'title': 'text'}}), null);
  });

  test('should extract missing value as null on missing key', () {
    expect(provider.getValue({'title': 'text'}), null);
  });

  test('should extract missing value as null on missing element', () {
    expect(provider.getValue(null), null);
  });
}
