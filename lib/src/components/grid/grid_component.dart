import 'dart:html';

import 'package:angular2/core.dart';
import 'package:pivot/src/data/grid_data_service.dart';
import 'package:pivot/src/factories/grid_layout_options_factory.dart';
import 'package:pivot/src/factories/grid_rendering_options_factory.dart';
import 'package:pivot/src/factories/grid_scrolling_options_factory.dart';
import 'package:pivot/src/layout/grid_layout_options.dart';
import 'package:pivot/src/layout/grid_layout_service.dart';
import 'package:pivot/src/models/grid_column.dart';
import 'package:pivot/src/models/grid_heading.dart';
import 'package:pivot/src/models/grid_sorting_direction.dart';
import 'package:pivot/src/rendering/browser_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_options.dart';
import 'package:pivot/src/rendering/grid_rendering_service.dart';
import 'package:pivot/src/scrolling/grid_scrolling_options.dart';
import 'package:pivot/src/scrolling/grid_scrolling_service.dart';
import 'package:pivot/src/sorting/grid_sorting_service.dart';
import 'package:pivot/src/sorting/grid_sorting_settings.dart';
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
    GridSortingService,
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
  final GridState state = new GridState();

  int _requestId = 0;

  @Input()
  List<Object> elements = [];

  @Input()
  List<GridColumn> columns = [];

  @Input()
  GridSortingSettings sortingSettings = const GridSortingSettings();

  @ViewChild('viewport')
  ElementRef viewportRef;

  GridComponent(this._stateService);

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    state.elements = elements;
    state.columns = columns;
    state.sortingSettings = sortingSettings;
    state.clientHeight = window.screen.height;

    _stateService.onDataChange(state);
  }

  bool isSortingAscending(GridSortingDirection direction) {
    return direction == GridSortingDirection.ascending;
  }

  bool isSortingDescending(GridSortingDirection direction) {
    return direction == GridSortingDirection.descending;
  }

  void onHeadingClick(GridHeading heading) {
    state.sortingHeading = heading;
    _stateService.onSortingChange(state);
  }

  void onScroll() {
    window.cancelAnimationFrame(_requestId);
    _requestId = window.requestAnimationFrame(_onFrame);
  }

  void _onFrame(num time) {
    Element viewport = viewportRef.nativeElement;
    state.scrollTop = viewport.scrollTop;
    state.clientHeight = window.screen.height;

    _stateService.onViewportChange(state);
  }
}
