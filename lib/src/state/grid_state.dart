import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_heading.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/scrolling/grid_visible_range.dart';
import 'package:pivot/src/sorting/grid_sorting_settings.dart';

class GridState {
  List<Object> elements = [];
  List<GridColumn> columns = [];
  List<GridHeading> headings = [];
  List<GridRow> rows = [];
  num scrollTop = 0;
  num clientHeight = 0;
  num scrollHeight = 0;
  GridHeading sortingHeading;
  GridSortingSettings sortingSettings = new GridSortingSettings();
  GridVisibleRange visibleRange = new GridVisibleRange(-1, -1);
  List<GridRow> visibleRows = [];
}
