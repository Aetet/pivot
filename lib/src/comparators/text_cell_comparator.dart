import 'package:pivot/src/comparators/grid_cell_comparator.dart';
import 'package:pivot/src/models/grid_cell.dart';

class TextCellComparator implements GridCellComparator {
  const TextCellComparator();

  @override
  int call(GridCell first, GridCell second) {
    return first.text.compareTo(second.text);
  }
}
