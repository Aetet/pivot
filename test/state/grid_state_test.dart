import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  test('should have empty state after initialization', () {
    GridState state = new GridState();

    expect(state.elements, []);
    expect(state.columns, []);
    expect(state.rows, []);
    expect(state.scrollTop, 0);
    expect(state.clientHeight, 0);
    expect(state.visibleRange, new GridVisibleRange(-1, -1));
    expect(state.visibleRows, []);
  });
}