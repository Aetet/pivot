import 'package:mockito/mockito.dart';
import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  GridScrollingOptions scrollingOptions = new GridScrollingOptions(excess: 50);
  GridLayoutService layoutService = new GridLayoutServiceMock();
  GridScrollingService scrollingService = new GridScrollingService(layoutService, scrollingOptions);

  test('should return visible range of rows based on layout', () {
    // arrange
    List<GridRow> rows = [new GridRow(), new GridRow(), new GridRow(), new GridRow()];
    when(layoutService.getRowIndex(rows, -40)).thenReturn(0);
    when(layoutService.getRowIndex(rows, 360)).thenReturn(3);

    // act
    GridVisibleRange visibleRange = scrollingService.getVisibleRange(rows, 10, 300);

    // assert
    expect(0, visibleRange.first);
    expect(3, visibleRange.last);
  });

  test('should return empty list for negative row indexes', () {
    // arrange
    List<GridRow> rows = [];
    GridVisibleRange visibleRange = new GridVisibleRange(-1, -1);

    // act & assert
    expect(scrollingService.getVisibleRows(rows, visibleRange), hasLength(0));
  });

  test('should return slice of rows for specified range', () {
    // arrange
    List<GridRow> rows = [new GridRow(), new GridRow(), new GridRow(), new GridRow()];
    GridVisibleRange visibleRange = new GridVisibleRange(1, 3);

    // act
    List<GridRow> visibleRows = scrollingService.getVisibleRows(rows, visibleRange);

    // assert
    expect(visibleRows, hasLength(3));
    expect(visibleRows[0], rows[1]);
    expect(visibleRows[1], rows[2]);
    expect(visibleRows[2], rows[3]);
  });
}
