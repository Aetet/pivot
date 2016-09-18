import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_heading.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';

class GridState {
  List<Object> elements = [];
  List<GridColumn> columns = [];
  List<GridHeading> headings = [];
  List<GridRow> rows = [];
  num scrollTop = 0;
  num clientHeight = 0;
  num scrollHeight = 0;
  GridVisibleRange visibleRange = new GridVisibleRange(-1, -1);
  List<GridRow> visibleRows = [];
}
