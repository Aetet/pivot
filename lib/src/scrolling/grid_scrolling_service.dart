import 'package:angular2/di.dart';
import 'package:pivot/src/layout/grid_layout_service.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/scrolling/grid_scrolling_options.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';

@Injectable()
class GridScrollingService {
  final GridLayoutService _layoutService;
  final GridScrollingOptions _scrollingOptions;

  GridScrollingService(this._layoutService, this._scrollingOptions);

  GridVisibleRange getVisibleRange(List<GridRow> rows, num scrollTop, num clientHeight) {
    int first = _layoutService.getRowIndex(rows, scrollTop - _scrollingOptions.excess);
    int last = _layoutService.getRowIndex(rows, scrollTop + clientHeight + _scrollingOptions.excess);

    return new GridVisibleRange(first, last);
  }

  List<GridRow> getVisibleRows(List<GridRow> rows, GridVisibleRange visibleRange) {
    if (visibleRange.first < 0 || visibleRange.last < 0) return [];

    return rows.sublist(visibleRange.first, visibleRange.last + 1);
  }
}
