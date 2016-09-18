import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';

class GridState {
  List<Object> elements = [];
  List<GridColumn> columns = [];
  List<GridRow> rows = [];
  num scrollTop;
  num clientHeight;
  GridVisibleRange visibleRange = new GridVisibleRange(-1, -1);
  List<GridRow> visibleRows = [];
}