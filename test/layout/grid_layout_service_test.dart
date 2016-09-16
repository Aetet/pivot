import 'package:pivot/pivot.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  GridRenderingService renderer = new GridRenderingServiceMock();
  GridLayoutOptions options = new GridLayoutOptions(rowHeight: 25, cellPadding: 5);
  GridLayoutService service = new GridLayoutService(renderer, options);

  test('should calculate heights by rendering text', () {
    // arrange
    GridCell cell1 = new GridCell()
      ..text = 'Some text'
      ..width = 100
      ..styles = new GridCellStyles(paddingLeft: 10);
    GridCell cell2 = new GridCell()
      ..text = 'Some very long text'
      ..width = 150
      ..styles = new GridCellStyles(backgroundColor: 'grey');

    GridRow row = new GridRow();
    row.cells.add(cell1);
    row.cells.add(cell2);
    List<GridRow> rows = [row];

    when(renderer.getTextHeight('Some text', 90)).thenReturn(20);
    when(renderer.getTextHeight('Some very long text', 150)).thenReturn(40);

    // act
    service.calculateHeights(rows);

    // assert
    expect(cell1.height, 20);
    expect(cell2.height, 40);
    expect(row.height, 45);
  });

  test('should calculate positions by stacking heights', () {
    // arrange
    List<GridRow> rows = [
      new GridRow()..height = 25,
      new GridRow()..height = 40,
      new GridRow()..height = 60,
      new GridRow()..height = 40
    ];

    // act
    service.calculatePositions(rows);

    // assert
    expect(rows[0].position, 0);
    expect(rows[1].position, 25);
    expect(rows[2].position, 65);
    expect(rows[3].position, 125);
  });

  test('should return negative index when there is no rows', () {
    expect(service.getRowIndex([], 10), -1);
  });

  test('should return zero index when position is below first row', () {
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 25
    ];

    expect(service.getRowIndex(rows, -20), 0);
  });

  test('should return zero index when position is at start of first row', () {
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 25
    ];

    expect(service.getRowIndex(rows, 0), 0);
  });

  test('should return zero index when position is at start of last row', () {
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 25
    ];

    expect(service.getRowIndex(rows, 25), 1);
  });

  test('should return zero index when position is above last row', () {
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 25
    ];

    expect(service.getRowIndex(rows, 30), 1);
  });
}
