import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_row.dart';

class GridDataService {
  List<GridRow> getRows(List<Object> elements, List<GridColumn> columns) {
    List<GridRow> rows = [];

    for (Object element in elements) {
      GridRow row = new GridRow();

      for (GridColumn column in columns) {
        dynamic value = column.provider.getValue(element);

        GridCell cell = new GridCell();
        cell.text = column.formatter.getText(value);
        cell.text = column.sanitizer.sanitize(cell.text);
        cell.html = column.encoder.getHtml(value, cell.text);
        cell.width = column.width;
        cell.paddingLeft = column.presenter.getPaddingLeft(value);
        cell.backgroundColor = column.presenter.getBackgroundColor(value);

        row.cells.add(cell);
      }

      rows.add(row);
    }

    return rows;
  }
}