import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  GridRenderingService renderer = new GridRenderingServiceMock();
  GridLayoutOptions options = new GridLayoutOptions(rowHeight: 25, cellPadding: 8);
  GridLayoutService service = new GridLayoutService(renderer, options);

  test('should calculate positions by stacking heights', () {
    List<GridRow> rows = [
      new GridRow()..height = 25,
      new GridRow()..height = 40,
      new GridRow()..height = 60,
      new GridRow()..height = 40
    ];

    service.calculatePositions(rows);

    expect(rows[0].position, 0);
    expect(rows[1].position, 25);
    expect(rows[2].position, 65);
    expect(rows[3].position, 125);
  });
}
