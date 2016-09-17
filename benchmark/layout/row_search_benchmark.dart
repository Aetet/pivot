import 'dart:math';
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:pivot/pivot.dart';

class RowSearchBenchmark extends BenchmarkBase {
  static const int rowCount = 100000;
  static const int rowHeight = 25;
  static const int rowVariation = 100;

  final Random _random = new Random(0);
  final GridLayoutService _service = new GridLayoutService(null, null);

  List<GridRow> _rows;

  RowSearchBenchmark() : super('RowSearch');

  GridRow getRow(int index) {
    return new GridRow()..position = index * (_random.nextInt(rowVariation) + rowHeight);
  }

  @override
  void setup() {
    _rows = new List.generate(rowCount, getRow);
  }

  @override
  void run() {
    _service.getRowIndex(_rows, 1);
  }
}

void main() {
  new RowSearchBenchmark().report();
}