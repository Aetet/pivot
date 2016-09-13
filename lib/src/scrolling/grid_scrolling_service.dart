import 'package:pivot/src/layout/grid_layout_service.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/scrolling/grid_scrolling_options.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';

class GridScrollingService {
  final GridLayoutService _layout;
  final GridScrollingOptions _options;

  GridScrollingService(this._layout, this._options);

  GridVisibleRange getVisibleRange(List<GridRow> rows, num offset, num height) {
    int first = _layout.getRowIndex(rows, offset - _options.excess);
    int last = _layout.getRowIndex(rows, offset + height + _options.excess);

    return new GridVisibleRange(first, last);
  }

  List<GridRow> getVisibleRows(List<GridRow> rows, GridVisibleRange range) {
    return rows.sublist(range.first, range.last > 0 ? range.last - 1 : 0);
  }
}