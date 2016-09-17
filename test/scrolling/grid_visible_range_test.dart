import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  test('ranges should be equal if first and last rows are the same', () {
    GridVisibleRange range1 = new GridVisibleRange(1, 3);
    GridVisibleRange range2 = new GridVisibleRange(1, 3);

    expect(range1, range2);
  });

  test('ranges should be not equal if first rows are not the same', () {
    GridVisibleRange range1 = new GridVisibleRange(1, 3);
    GridVisibleRange range2 = new GridVisibleRange(2, 3);

    expect(range1, isNot(range2));
  });

  test('ranges should be not equal if last rows are not the same', () {
    GridVisibleRange range1 = new GridVisibleRange(1, 3);
    GridVisibleRange range2 = new GridVisibleRange(1, 4);

    expect(range1, isNot(range2));
  });

  test('ranges hash codes should be equal if first and last rows are the same', () {
    GridVisibleRange range1 = new GridVisibleRange(1, 3);
    GridVisibleRange range2 = new GridVisibleRange(1, 3);

    expect(range1.hashCode, range2.hashCode);
  });
}
