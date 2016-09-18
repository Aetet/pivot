import 'package:angular2/angular2.dart';
import 'package:pivot/src/models/grid_cell.dart';

@Component(
  selector: 'plain-text-cell',
  directives: const [],
  templateUrl: 'plain_text_cell.html'
)
class PlainTextCell {
  @Input()
  GridCell cell;
}
