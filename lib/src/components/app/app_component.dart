import 'package:angular2/core.dart';
import 'package:pivot/src/components/grid/grid_component.dart';
import 'package:pivot/src/formatters/date_value_formatter.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/providers/key_value_provider.dart';

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

  List<Object> elements = new List.generate(1000, (int index) {
    return {'id': index, 'title': titles[index % titles.length], 'date': 1474187245000};
  });

  List<GridColumn> columns = [
    new GridColumn(
      id: 'id',
      title: 'ID',
      width: 100,
      provider: new KeyValueProvider('id')
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
      formatter: new DateValueFormatter('MM/dd/yyyy')
    )
  ];
}
