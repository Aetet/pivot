import 'package:angular2/di.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_heading.dart';
import 'package:pivot/src/models/grid_row.dart';

@Injectable()
class GridDataService {
  List<GridColumn> getVisibleColumns(List<String> visibleColumns, List<GridColumn> columns) {
    return visibleColumns.fold([], (List<GridColumn> resultColumns, String visibleColumn) {
      GridColumn resultVisibleColumn = columns.firstWhere((GridColumn column) {
        return column.id == visibleColumn;
      }, orElse: () => null);
      if (resultVisibleColumn != null) {
        resultColumns.add(resultVisibleColumn);
      }
      return resultColumns;
    });
  }
  List<GridHeading> getHeadings(List<GridColumn> columns) {
    List<GridHeading> headings = [];

    for (GridColumn column in columns) {
      GridHeading heading = new GridHeading();
      heading.id = column.id;
      heading.title = column.title;
      heading.width = column.width;

      headings.add(heading);
    }

    return headings;
  }

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
