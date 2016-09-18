import 'dart:html';

import 'package:angular2/di.dart';
import 'package:pivot/src/rendering/grid_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_options.dart';

@Injectable()
class BrowserRenderingContext implements GridRenderingContext {
  final GridRenderingOptions _options;
  CanvasElement _canvas;
  CanvasRenderingContext2D _context;

  BrowserRenderingContext(this._options);

  @override
  num getTextWidth(String text) {
    _canvas = _canvas ?? new CanvasElement();
    _context = _context ?? _canvas.getContext('2d');
    _context.font = _options.font;

    return _context.measureText(text).width;
  }
}
