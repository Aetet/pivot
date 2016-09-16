import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  DateValueFormatter formatter = new DateValueFormatter('MM/dd/yyyy');

  test('should format milliseconds as date with pattern', () {
    DateTime date = new DateTime(2000, 10, 15);
    int milliseconds = date.millisecondsSinceEpoch;

    expect(formatter.getText(milliseconds), '10/15/2000');
  });

  test('should format null value as empty string', () {
    expect(formatter.getText(null), '');
  });
}
