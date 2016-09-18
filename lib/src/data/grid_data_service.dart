import 'package:angular2/di.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_row.dart';

@Injectable()
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
        cell.html = column.encoder.getHtml(cell.text, element);
        cell.width = column.width;
        cell.styles = column.presenter.getStyles(cell.value);

        row.cells.add(cell);
      }

      rows.add(row);
    }

    return rows;
  }
}
