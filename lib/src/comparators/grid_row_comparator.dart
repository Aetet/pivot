import 'package:pivot/src/comparators/grid_cell_comparator.dart';
import 'package:pivot/src/models/grid_row.dart';

class GridRowComparator {
  final GridCellComparator _comparator;
  final int _index;
  final int _sign;

  GridRowComparator(this._comparator, this._index, this._sign);

  int call(GridRow first, GridRow second) {
    return _sign * _comparator(first.cells[_index], second.cells[_index]);
  }
}
