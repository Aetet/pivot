import 'dart:math';

import 'package:pivot/src/layout/grid_layout_options.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/rendering/grid_rendering_service.dart';

class GridLayoutService {
  final GridRenderingService _renderer;
  final GridLayoutOptions _options;

  GridLayoutService(this._renderer, this._options);

  void calculateHeights(List<GridRow> rows) {
    for (GridRow row in rows) {
      row.height = _options.rowHeight;

      for (GridCell cell in row.cells) {
        cell.height = _renderer.getTextHeight(cell.text, cell.width - cell.paddingLeft);
        row.height = max(row.height, cell.height);
      }

      row.height += _options.cellPadding;
    }
  }

  void calculatePositions(List<GridRow> rows) {
    num position = 0;

    for (GridRow row in rows) {
      row.position = position;
      position += row.height;
    }
  }
}
