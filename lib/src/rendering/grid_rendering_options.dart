import 'package:angular2/di.dart';

@Injectable()
class GridRenderingOptions {
  final String font;
  final num lineHeight;

  const GridRenderingOptions({this.font, this.lineHeight});
}
