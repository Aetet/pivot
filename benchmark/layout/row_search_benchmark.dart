import 'dart:math';
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:pivot/pivot.dart';

class RowSearchBenchmark extends BenchmarkBase {
  static const int rowCount = 100000;
  static const int rowHeight = 25;
  static const int rowVariation = 100;

  List<GridRow> _rows;
  GridLayoutService _service;

  RowSearchBenchmark() : super('RowSearch');

  @override
  void setup() {
    Random random = new Random(0);
    _rows = new List.generate(rowCount,
      (int index) => new GridRow()..position = index * (random.nextInt(rowVariation) + rowHeight));

    _service = new GridLayoutService(null, null);
  }

  @override
  void run() {
    _service.getRowIndex(_rows, 1);
  }
}

void main() {
  new RowSearchBenchmark().report();
}