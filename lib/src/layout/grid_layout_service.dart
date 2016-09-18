import 'dart:math';

import 'package:angular2/di.dart';
import 'package:pivot/src/layout/grid_layout_options.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/rendering/grid_rendering_service.dart';

@Injectable()
class GridLayoutService {
  final GridRenderingService _renderingService;
  final GridLayoutOptions _layoutOptions;

  GridLayoutService(this._renderingService, this._layoutOptions);

  void calculateHeights(List<GridRow> rows) {
    for (GridRow row in rows) {
      num maxHeight = 0;

      for (GridCell cell in row.cells) {
        num paddingLeft = cell.styles.paddingLeft ?? _layoutOptions.paddingLeft;
        num contentWidth = cell.width - _layoutOptions.borderWidth * 2 - paddingLeft - _layoutOptions.paddingRight;
        num contentHeight = _renderingService.getTextHeight(cell.text, contentWidth);

        maxHeight = max(maxHeight, contentHeight);
      }

      num offsetHeight = maxHeight + _layoutOptions.borderWidth * 2 + _layoutOptions.paddingTop + _layoutOptions.paddingBottom;
      row.height = max(offsetHeight, _layoutOptions.rowHeight);
    }
  }

  void calculatePositions(List<GridRow> rows) {
    num position = 0;

    for (GridRow row in rows) {
      row.position = position;
      position += row.height;
    }
  }

  num getScrollHeight(List<GridRow> rows) {
    if (rows.length == 0) return 0;

    return rows.last.position + rows.last.height;
  }

  int getRowIndex(List<GridRow> rows, num position) {
    if (rows.length == 0) return -1;
    if (position <= rows.first.position) return 0;
    if (position >= rows.last.position) return rows.length - 1;

    int low = 0;
    int middle = 0;
    int high = rows.length - 1;

    while (low != high) {
      middle = (low + (high - low) / 2).floor();

      if (position < rows[middle].position) {
        high = middle - 1;
      } else if (position >= rows[middle + 1].position) {
        low = middle + 1;
      } else {
        return middle;
      }
    }

    return low;
  }
}
