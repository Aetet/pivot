import 'package:angular2/di.dart';

@Injectable()
abstract class GridRenderingContext {
  num getTextWidth(String text);
}
