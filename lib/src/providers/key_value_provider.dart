import 'package:pivot/src/providers/value_provider.dart';

class KeyValueProvider implements ValueProvider<Map, Object> {
  final String _key;

  const KeyValueProvider(this._key);

  @override
  Object getValue(Map element) {
    return element != null ? element[_key] : null;
  }
}
