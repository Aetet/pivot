import 'package:pivot/src/providers/value_provider.dart';

class SelfValueProvider implements ValueProvider<Object, Object> {
  const SelfValueProvider();

  @override
  Object getValue(Object element) {
    return element;
  }
}
