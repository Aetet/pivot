import 'package:angular2/angular2.dart';
import 'package:pivot/src/components/cell_renderer/cell_renderer.dart';
import 'package:pivot/src/components/cells/link_cell/link_cell.dart';
import 'package:pivot/src/components/cells/plain_text_cell/plain_text_cell.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/typedefs/InitViewProperties.dart';

@Component(
  selector: 'my-app',
  directives: const [
    CellRenderer
  ],
  templateUrl: 'app.html'
)
class AppComponent {
  InitViewProperties initViewProperties = (dynamic instance, GridCell cell) {
    if (instance is LinkCell) {
      instance.href = 'JohnDoe';
    }
    instance.cell = cell;
  };
  List<GridCell> cells = [
    new GridCell()
      ..value = 'Harambaroo'
      ..CellType = LinkCell
      ,
    new GridCell()
      ..value = 'Harroo'
      ..CellType = PlainTextCell

  ];

  handleClick() {
    cells[0].value = 'Likan';
  }
}
