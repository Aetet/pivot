import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_row.dart';

class GridDataService {
  List<GridRow> getRows(List<Object> elements, List<GridColumn> columns) {
    List<GridRow> rows = [];

    for (Object element in elements) {
      GridRow row = new GridRow();

      for (GridColumn column in columns) {
        GridCell cell = new GridCell();
        cell.value = column.provider.getValue(element);
        cell.text = column.formatter.getText(cell.value);
        cell.text = column.sanitizer.sanitize(cell.text);
        cell.html = column.encoder.getHtml(cell.value, cell.text);
        cell.width = column.width;
        cell.paddingLeft = column.presenter.getPaddingLeft(cell.value);
        cell.backgroundColor = column.presenter.getBackgroundColor(cell.value);

        row.cells.add(cell);
      }

      rows.add(row);
    }

    return rows;
  }
}