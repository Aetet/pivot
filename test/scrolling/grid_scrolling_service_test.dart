import 'package:mockito/mockito.dart';
import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  GridScrollingOptions options = new GridScrollingOptions(excess: 50);
  GridLayoutService layout = new GridLayoutServiceMock();
  GridScrollingService service = new GridScrollingService(layout, options);

  test('should return visible range of rows based on layout', () {
    // arrange
    List<GridRow> rows = [new GridRow(), new GridRow(), new GridRow(), new GridRow()];
    when(layout.getRowIndex(rows, -40)).thenReturn(0);
    when(layout.getRowIndex(rows, 360)).thenReturn(3);

    // act
    GridVisibleRange range = service.getVisibleRange(rows, 10, 300);

    // assert
    expect(0, range.first);
    expect(3, range.last);
  });

  test('should return empty list for negative row indexes', () {
    // arrange
    List<GridRow> rows = [];
    GridVisibleRange range = new GridVisibleRange(-1, -1);

    // act & assert
    expect(service.getVisibleRows(rows, range), hasLength(0));
  });

  test('should return slice of rows for specified range', () {
    // arrange
    List<GridRow> rows = [new GridRow(), new GridRow(), new GridRow(), new GridRow()];
    GridVisibleRange range = new GridVisibleRange(1, 3);

    // act
    List<GridRow> slice = service.getVisibleRows(rows, range);

    // assert
    expect(slice, hasLength(3));
    expect(slice[0], rows[1]);
    expect(slice[1], rows[2]);
    expect(slice[2], rows[3]);
  });
}
