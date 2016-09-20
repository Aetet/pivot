import 'package:angular2/core.dart';
import 'package:pivot/src/comparators/value_cell_comparator.dart';
import 'package:pivot/src/components/grid/grid_component.dart';
import 'package:pivot/src/formatters/date_value_formatter.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_sorting_direction.dart';
import 'package:pivot/src/providers/key_value_provider.dart';
import 'package:pivot/src/sorting/grid_sorting_settings.dart';

@Component(
  selector: 'pivot-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [GridComponent]
)
class AppComponent {
  static List<String> titles = [
    'Fix grouping by assignee',
    'Inconsistent filters in tasklist and reports',
    'Confirmation when pressing backspace while fields are out of focus',
    'Support entering data in table view',
    'Report for folder with a lot of custom fields'
  ];
  static List<String> authors = [
    'John Doe',
    'Marilyn Monroe',
    'Jane Doe',
    'Madao',
    'Sackville Baggins',
    'Leonarm Nimoy',
    'Captain Kirk'
  ];
  List visibleColumns = [
    'title',
    'author'
  ];

  List<Object> elements = new List.generate(1000, (int index) {
    return {
      'id': index,
      'title': titles[index % titles.length],
      'date': 86400000 * index,
      'author': authors[index%titles.length]
    };
  });

  List<GridColumn> columns = [
    new GridColumn(
      id: 'id',
      title: 'ID',
      width: 100,
      provider: new KeyValueProvider('id'),
      comparator: new ValueCellComparator()
    ),
    new GridColumn(
      id: 'title',
      title: 'Title',
      width: 300,
      provider: new KeyValueProvider('title')
    ),
    new GridColumn(
      id: 'date',
      title: 'Date',
      width: 120,
      provider: new KeyValueProvider('date'),
      formatter: new DateValueFormatter('MM/dd/yyyy'),
      comparator: new ValueCellComparator()
    ),
    new GridColumn(
      id: 'author',
      title: 'Author',
      width: 110,
      provider: new KeyValueProvider('author')
    )
  ];

  GridSortingSettings sortingSettings = new GridSortingSettings(
    id: 'id',
    direction: GridSortingDirection.ascending
  );
}
