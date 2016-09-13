import 'package:quiver/core.dart';

class GridVisibleRange {
  final int first;
  final int last;

  GridVisibleRange(this.first, this.last);

  @override
  bool operator ==(dynamic other) {
    return other is GridVisibleRange && first == other.first && last == other.last;
  }

  @override
  int get hashCode {
    return hash2(first, last);
  }
}
