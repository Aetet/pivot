import 'package:pivot/src/encoders/value_encoder.dart';
import 'package:pivot/src/formatters/value_formatter.dart';
import 'package:pivot/src/presenters/value_presenter.dart';
import 'package:pivot/src/providers/value_provider.dart';
import 'package:pivot/src/sanitizers/value_sanitizer.dart';

class GridColumn {
  final String id;
  final String title;
  final num width;
  final ValueProvider provider;
  final ValueFormatter formatter;
  final ValueSanitizer sanitizer;
  final ValueEncoder encoder;
  final ValuePresenter presenter;

  GridColumn({
    this.id,
    this.title,
    this.width,
    this.provider,
    this.formatter,
    this.sanitizer,
    this.encoder,
    this.presenter
  });
}
