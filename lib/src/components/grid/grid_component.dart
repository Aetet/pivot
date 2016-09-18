import 'dart:html';

import 'package:angular2/core.dart';
import 'package:pivot/src/data/grid_data_service.dart';
import 'package:pivot/src/factories/grid_layout_options_factory.dart';
import 'package:pivot/src/factories/grid_rendering_options_factory.dart';
import 'package:pivot/src/factories/grid_scrolling_options_factory.dart';
import 'package:pivot/src/layout/grid_layout_options.dart';
import 'package:pivot/src/layout/grid_layout_service.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/rendering/browser_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_options.dart';
import 'package:pivot/src/rendering/grid_rendering_service.dart';
import 'package:pivot/src/scrolling/grid_scrolling_options.dart';
import 'package:pivot/src/scrolling/grid_scrolling_service.dart';
import 'package:pivot/src/state/grid_state.dart';
import 'package:pivot/src/state/grid_state_service.dart';

@Component(
  selector: 'pivot-grid',
  templateUrl: 'grid_component.html',
  styleUrls: const ['grid_component.css'],
  providers: const [
    GridStateService,
    GridDataService,
    GridLayoutService,
    GridScrollingService,
    GridRenderingService,
    const Provider(GridRenderingContext, useClass: BrowserRenderingContext),
    const Provider(GridRenderingOptions, useFactory: GridRenderingOptionsFactory),
    const Provider(GridLayoutOptions, useFactory: GridLayoutOptionsFactory),
    const Provider(GridScrollingOptions, useFactory: GridScrollingOptionsFactory)
  ]
)
class GridComponent implements OnChanges {
  final GridStateService _stateService;
  int _requestId = 0;

  final GridState state = new GridState();

  @Input()
  List<Object> elements = [];

  @Input()
  List<GridColumn> columns = [];

  @ViewChild('body')
  ElementRef bodyRef;

  GridComponent(this._stateService);

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    bool isDataChanged = changes.containsKey('elements') || changes.containsKey('columns');

    if (isDataChanged) {
      state.elements = elements;
      state.columns = columns;
      state.clientHeight = window.screen.height;

      _stateService.onDataChange(state);
    }
  }

  void onScroll() {
    window.cancelAnimationFrame(_requestId);
    _requestId = window.requestAnimationFrame(_onFrame);
  }

  void _onFrame(num time) {
    Element body = bodyRef.nativeElement;
    state.scrollTop = body.scrollTop;
    state.clientHeight = window.screen.height;

    _stateService.onViewportChange(state);
  }
}
