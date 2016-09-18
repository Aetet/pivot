import 'package:pivot/src/layout/grid_layout_service.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/scrolling/grid_scrolling_options.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';

class GridScrollingService {
  final GridLayoutService _layout;
  final GridScrollingOptions _options;

  GridScrollingService(this._layout, this._options);

  GridVisibleRange getVisibleRange(List<GridRow> rows, num scrollTop, num clientHeight) {
    int first = _layout.getRowIndex(rows, scrollTop - _options.excess);
    int last = _layout.getRowIndex(rows, scrollTop + clientHeight + _options.excess);

    return new GridVisibleRange(first, last);
  }

  List<GridRow> getVisibleRows(List<GridRow> rows, GridVisibleRange range) {
    if (range.first < 0 || range.last < 0) return [];

    return rows.sublist(range.first, range.last + 1);
  }
}
