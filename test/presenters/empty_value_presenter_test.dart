import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  EmptyValuePresenter presenter = new EmptyValuePresenter();

  test('should return empty styles for any value', () {
    GridCellStyles styles = presenter.getStyles(null);

    expect(styles.paddingLeft, 0);
    expect(styles.backgroundColor, null);
  });
}
