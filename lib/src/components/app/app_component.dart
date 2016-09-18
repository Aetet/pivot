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
  List<Object> elements = [
    { 'id': 1, 'title': 'Reports', 'date': 1474187245000},
    { 'id': 2, 'title': 'Request Forms', 'date': 1474273642000}
  ];

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
