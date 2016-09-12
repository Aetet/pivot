import 'package:pivot/src/encoders/html_value_encoder.dart';
import 'package:pivot/src/encoders/value_encoder.dart';
import 'package:pivot/src/formatters/text_value_formatter.dart';
import 'package:pivot/src/formatters/value_formatter.dart';
import 'package:pivot/src/presenters/empty_value_presenter.dart';
import 'package:pivot/src/presenters/value_presenter.dart';
import 'package:pivot/src/providers/self_value_provider.dart';
import 'package:pivot/src/providers/value_provider.dart';
import 'package:pivot/src/sanitizers/value_sanitizer.dart';
import 'package:pivot/src/sanitizers/white_space_sanitizer.dart';

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
    this.provider: const SelfValueProvider(),
    this.formatter: const TextValueFormatter(),
    this.sanitizer: const WhiteSpaceSanitizer(),
    this.encoder: const HtmlValueEncoder(),
    this.presenter: const EmptyValuePresenter()
  });
}
