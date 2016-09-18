import 'package:angular2/angular2.dart';
import 'package:pivot/src/models/grid_cell.dart';
import 'package:pivot/src/typedefs/InitViewProperties.dart';

@Component(
  selector: 'cell-renderer',
  directives: const [],
  templateUrl: 'cell_renderer.html'
)
class CellRenderer implements AfterViewInit {
  final ComponentResolver _componentResolver;
  final ViewContainerRef _viewContainerRef;
  CellRenderer(this._viewContainerRef, this._componentResolver);

  @Input()
  GridCell cell;


  @Input()
  InitViewProperties initViewProperties = (dynamic instance, GridCell cell) {
    instance.cell = cell;
  };

  @override
  ngAfterViewInit() async {
    ComponentFactory componentFactory = await _componentResolver.resolveComponent(cell.CellType);
    ComponentRef componentRef = _viewContainerRef.createComponent(componentFactory);

    initViewProperties(componentRef.instance, cell);
  }
}
