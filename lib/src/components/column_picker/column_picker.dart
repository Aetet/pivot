import 'package:angular2/angular2.dart';
import 'package:pivot/src/models/grid_column.dart';

@Component(
  selector: 'column-picker',
  directives: const [],
  templateUrl: 'column_picker.html'
)
class ColumnPicker {
  @Input()
  List<String> visibleColumns = [];
  @Input()
  List<GridColumn> columns = [];

  @Output('change')
  EventEmitter changeEmitter = new EventEmitter();

  @Output('changedVisibleColumns')
  EventEmitter changeVisibleEmitter = new EventEmitter();

  handleClick(GridColumn column, bool isChecked) {
    print('Click on column: ${column.id}, checked: ${isChecked}, visible: ${visibleColumns}');
    changeEmitter.emit(column);

    List<String> changedVisibleColumns = new List.from(visibleColumns);

    if (!isChecked) {
      changedVisibleColumns.remove(column.id);
    } else {
      changedVisibleColumns.add(column.id);
    }
    changeVisibleEmitter.emit(changedVisibleColumns);
  }
}
