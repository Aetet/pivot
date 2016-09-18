import 'package:angular2/di.dart';
import 'package:pivot/src/data/grid_data_service.dart';
import 'package:pivot/src/layout/grid_layout_service.dart';
import 'package:pivot/src/scrolling/grid_scrolling_service.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';
import 'package:pivot/src/state/grid_state.dart';

@Injectable()
class GridStateService {
  final GridDataService _dataService;
  final GridLayoutService _layoutService;
  final GridScrollingService _scrollingService;

  GridStateService(this._dataService, this._layoutService, this._scrollingService);

  void onDataChange(GridState state) {
    state.rows = _dataService.getRows(state.elements, state.columns);
    _layoutService.calculateHeights(state.rows);
    _layoutService.calculatePositions(state.rows);
    state.visibleRange = _scrollingService.getVisibleRange(state.rows, state.scrollTop, state.clientHeight);
    state.visibleRows = _scrollingService.getVisibleRows(state.rows, state.visibleRange);
  }

  void onViewportChange(GridState state) {
    GridVisibleRange visibleRange = _scrollingService.getVisibleRange(state.rows, state.scrollTop, state.clientHeight);
    if (visibleRange != state.visibleRange) {
      state.visibleRange = visibleRange;
      state.visibleRows = _scrollingService.getVisibleRows(state.rows, state.visibleRange);
    }
  }
}
