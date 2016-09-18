import 'package:angular2/di.dart';

@Injectable()
class GridLayoutOptions {
  final num rowHeight;
  final num borderWidth;
  final num paddingTop;
  final num paddingBottom;
  final num paddingLeft;
  final num paddingRight;

  const GridLayoutOptions({
    this.rowHeight,
    this.borderWidth,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight
  });
}
