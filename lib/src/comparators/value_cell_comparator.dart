import 'package:pivot/src/comparators/grid_cell_comparator.dart';
import 'package:pivot/src/models/grid_cell.dart';

class ValueCellComparator implements GridCellComparator {
  const ValueCellComparator();

  @override
  int call(GridCell first, GridCell second) {
    return first.value.compareTo(second.value);
  }
}
