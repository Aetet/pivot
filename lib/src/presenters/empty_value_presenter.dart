import 'package:pivot/src/models/grid_cell_styles.dart';
import 'package:pivot/src/presenters/value_presenter.dart';

class EmptyValuePresenter implements ValuePresenter<Object> {
  static final GridCellStyles _styles = const GridCellStyles();

  const EmptyValuePresenter();

  @override
  GridCellStyles getStyles(Object value) {
    return _styles;
  }
}
