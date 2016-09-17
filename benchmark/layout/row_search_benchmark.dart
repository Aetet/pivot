import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:pivot/pivot.dart';

abstract class RowSearchBenchmark extends BenchmarkBase {
  static const int rowCount = 100000;
  static const int rowHeight = 25;
  static const int rowVariation = 100;

  final Random random = new Random(0);
  final GridLayoutService service = new GridLayoutService(null, null);

  List<GridRow> rows;

  RowSearchBenchmark(String name) : super(name);

  @override
  void setup() {
    rows = new List<GridRow>(rowCount);

    for (int i = 0; i < rowCount; i++) {
      GridRow row = new GridRow();

      if (i > 0) {
        row.position = rows[i - 1].position + rowHeight + random.nextInt(rowVariation);
      } else {
        row.position = 0;
      }

      rows[i] = row;
    }
  }
}

class FirstRowSearchBenchmark extends RowSearchBenchmark {
  FirstRowSearchBenchmark() : super('FirstRowSearch');

  @override
  void run() {
    service.getRowIndex(rows, 1);
  }
}

class LastRowSearchBenchmark extends RowSearchBenchmark {
  LastRowSearchBenchmark() : super('LastRowSearch');

  @override
  void run() {
    service.getRowIndex(rows, rows.last.position - 1);
  }
}

class MiddleRowSearchBenchmark extends RowSearchBenchmark {
  MiddleRowSearchBenchmark() : super('MiddleRowSearch');

  @override
  void run() {
    service.getRowIndex(rows, rows[(rows.length / 2).floor()].position);
  }
}

void main() {
  new FirstRowSearchBenchmark().report();
  new LastRowSearchBenchmark().report();
  new MiddleRowSearchBenchmark().report();
}