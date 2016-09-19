import 'package:pivot/src/models/grid_cell.dart';

abstract class GridCellComparator {
  int call(GridCell first, GridCell second);
}
