import 'package:angular2/angular2.dart';
import 'package:pivot/src/components/cells/cell.dart';
import 'package:pivot/src/components/dynamic_component_renderer/dynamic_component_renderer.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/typedefs/init_view_properties.dart';

@Component(
  selector: 'cell-renderer',
  directives: const [
    DynamicComponentRenderer
  ],
  templateUrl: 'cell_renderer.html'
)
class CellRenderer implements OnInit {
  @Input()
  GridCell cell;

  @Input()
  InitViewProperties initViewProperties;

  @override
  ngOnInit() {
    initViewProperties = initViewProperties ?? (Cell instance) {
      instance.cell = cell;
    };
  }
}
