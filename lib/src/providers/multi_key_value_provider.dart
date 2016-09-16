import 'package:pivot/src/providers/value_provider.dart';

class MultiKeyValueProvider implements ValueProvider<Map, Object> {
  final List<String> _keys;

  const MultiKeyValueProvider(this._keys);

  @override
  Object getValue(Map element) {
    return _keys.fold(element, (Map value, String key) => value != null ? value[key] : null);
  }
}
