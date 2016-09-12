import 'package:intl/intl.dart';
import 'package:pivot/src/formatters/value_formatter.dart';

class DateValueFormatter implements ValueFormatter<int> {
  final DateFormat _formatter;

  DateValueFormatter(String pattern) : _formatter = new DateFormat(pattern);

  @override
  String getText(int value) {
    return value != null ? _formatter.format(new DateTime.fromMillisecondsSinceEpoch(value)) : '';
  }
}
