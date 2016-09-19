import 'package:angular2/di.dart';
import 'package:pivot/src/comparators/grid_row_comparator.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_heading.dart';
import 'package:pivot/src/models/grid_row.dart';
import 'package:pivot/src/models/grid_sorting_direction.dart';
import 'package:pivot/src/sorting/grid_sorting_settings.dart';

@Injectable()
class GridSortingService {
  void sortHeadings(List<GridHeading> headings, GridSortingSettings settings) {
    for (GridHeading heading in headings) {
      heading.direction = heading.id == settings.id ? settings.direction : null;
    }
  }

  void sortRows(List<GridRow> rows, List<GridColumn> columns, GridSortingSettings settings) {
    GridColumn column = columns.firstWhere((GridColumn column) => column.id == settings.id, orElse: () => null);
    if (column == null) return;

    int index = columns.indexOf(column);
    int sign = settings.direction == GridSortingDirection.ascending ? 1 : -1;
    GridRowComparator comparator = new GridRowComparator(column.comparator, index, sign);
    rows.sort(comparator);
  }

  GridSortingSettings flipSorting(GridHeading heading, GridSortingSettings settings) {
    GridSortingDirection direction;

    if (settings.id == heading.id) {
      direction = settings.direction == GridSortingDirection.ascending ? GridSortingDirection.descending : GridSortingDirection.ascending;
    } else {
      direction = GridSortingDirection.descending;
    }

    return new GridSortingSettings(id: heading.id, direction: direction);
  }
}
