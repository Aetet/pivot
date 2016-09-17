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
      num maxHeight = 0;

      for (GridCell cell in row.cells) {
        num paddingLeft = cell.styles.paddingLeft ?? _options.paddingLeft;
        num contentWidth = cell.width - _options.borderWidth * 2 - paddingLeft - _options.paddingRight;
        num contentHeight = _renderer.getTextHeight(cell.text, contentWidth);

        maxHeight = max(maxHeight, contentHeight);
      }

      num offsetHeight = maxHeight + _options.borderWidth * 2 + _options.paddingTop + _options.paddingBottom;
      row.height = max(offsetHeight, _options.rowHeight);
    }
  }

  void calculatePositions(List<GridRow> rows) {
    num position = 0;

    for (GridRow row in rows) {
      row.position = position;
      position += row.height;
    }
  }

  int getRowIndex(List<GridRow> rows, num position) {
    if (rows.length == 0) return -1;
    if (position <= rows.first.position) return 0;
    if (position >= rows.last.position) return rows.length - 1;

    int low = 0;
    int middle = 0;
    int high = rows.length - 1;

    while(low < high) {
      middle = (low + (high - low) / 2).floor();

      if (position >= rows[middle].position) {
        if (low == middle) break;
        low = middle;
      }
      else {
        if (high == middle) break;
        high = middle;
      }
    }

    return middle;
  }
}
