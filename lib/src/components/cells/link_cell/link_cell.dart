import 'package:angular2/angular2.dart';
import 'package:pivot/src/components/cells/cell.dart';
import 'package:pivot/src/models/grid_cell.dart';

@Component(
  selector: 'link-cell',
  directives: const [],
  templateUrl: 'link_cell.html'
)
class LinkCell implements OnInit, Cell {
  @Input()
  GridCell cell;
  @Input()
  String href;

  @override
  ngOnInit() {
    href = (href == null) ? cell.value : href;
  }
}
