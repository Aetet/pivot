import 'package:pivot/pivot.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  GridLayoutOptions options = new GridLayoutOptions(
    rowHeight: 25,
    borderWidth: 1,
    paddingTop: 2,
    paddingBottom: 2,
    paddingLeft: 8,
    paddingRight: 8
  );

  GridRenderingService renderer = new GridRenderingServiceMock();
  GridLayoutService service = new GridLayoutService(renderer, options);

  test('should calculate heights by rendering text', () {
    // arrange
    GridCell cell1 = new GridCell()
      ..text = 'Some text'
      ..width = 100
      ..styles = new GridCellStyles(paddingLeft: 15);
    GridCell cell2 = new GridCell()
      ..text = 'Some very long text'
      ..width = 150
      ..styles = new GridCellStyles(backgroundColor: 'grey');

    GridRow row = new GridRow();
    row.cells.add(cell1);
    row.cells.add(cell2);
    List<GridRow> rows = [row];

    when(renderer.getTextHeight('Some text', 75)).thenReturn(20);
    when(renderer.getTextHeight('Some very long text', 132)).thenReturn(40);

    // act
    service.calculateHeights(rows);

    // assert
    expect(row.height, 46);
  });

  test('should use default row height if cells are collapsed', () {
    // arrange
    GridCell cell1 = new GridCell()
      ..text = ''
      ..width = 100
      ..styles = new GridCellStyles(paddingLeft: 15);
    GridCell cell2 = new GridCell()
      ..text = ''
      ..width = 150
      ..styles = new GridCellStyles(backgroundColor: 'grey');

    GridRow row = new GridRow();
    row.cells.add(cell1);
    row.cells.add(cell2);
    List<GridRow> rows = [row];

    when(renderer.getTextHeight('', 75)).thenReturn(0);
    when(renderer.getTextHeight('', 132)).thenReturn(0);

    // act
    service.calculateHeights(rows);

    // assert
    expect(row.height, 25);
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

  test('should return correct index for 1 row', () {
    // arrange
    List<GridRow> rows = [
      new GridRow()..position = 0
    ];

    // act & assert
    expect(service.getRowIndex(rows, -10), 0);
    expect(service.getRowIndex(rows, 0), 0);
    expect(service.getRowIndex(rows, 20), 0);
  });

  test('should return correct index for 2 rows', () {
    // arrange
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 25
    ];

    // act & assert
    expect(service.getRowIndex(rows, -5), 0);
    expect(service.getRowIndex(rows, 0), 0);
    expect(service.getRowIndex(rows, 1), 0);
    expect(service.getRowIndex(rows, 10), 0);
    expect(service.getRowIndex(rows, 15), 0);
    expect(service.getRowIndex(rows, 24), 0);
    expect(service.getRowIndex(rows, 25), 1);
    expect(service.getRowIndex(rows, 30), 1);
    expect(service.getRowIndex(rows, 50), 1);
  });

  test('should return correct index for 3 rows', () {
    // arrange
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 60,
      new GridRow()..position = 90
    ];

    // act & assert
    expect(service.getRowIndex(rows, -100), 0);
    expect(service.getRowIndex(rows, 0), 0);
    expect(service.getRowIndex(rows, 10), 0);
    expect(service.getRowIndex(rows, 50), 0);
    expect(service.getRowIndex(rows, 60), 1);
    expect(service.getRowIndex(rows, 80), 1);
    expect(service.getRowIndex(rows, 89), 1);
    expect(service.getRowIndex(rows, 90), 2);
    expect(service.getRowIndex(rows, 100), 2);
    expect(service.getRowIndex(rows, 200), 2);
  });

  test('should return correct index for 4 rows', () {
    // arrange
    List<GridRow> rows = [
      new GridRow()..position = 0,
      new GridRow()..position = 23,
      new GridRow()..position = 60,
      new GridRow()..position = 119
    ];

    // act & assert
    expect(service.getRowIndex(rows, -1), 0);
    expect(service.getRowIndex(rows, 0), 0);
    expect(service.getRowIndex(rows, 15), 0);
    expect(service.getRowIndex(rows, 20), 0);
    expect(service.getRowIndex(rows, 23), 1);
    expect(service.getRowIndex(rows, 50), 1);
    expect(service.getRowIndex(rows, 60), 2);
    expect(service.getRowIndex(rows, 100), 2);
    expect(service.getRowIndex(rows, 115), 2);
    expect(service.getRowIndex(rows, 119), 3);
    expect(service.getRowIndex(rows, 200), 3);
  });
}
