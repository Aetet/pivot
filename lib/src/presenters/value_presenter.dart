import 'package:pivot/src/models/grid_cell_styles.dart';

abstract class ValuePresenter<V> {
  GridCellStyles getStyles(V value);
}
