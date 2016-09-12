import 'package:pivot/src/presenters/value_presenter.dart';

class EmptyValuePresenter implements ValuePresenter<Object> {
  const EmptyValuePresenter();

  @override
  num getPaddingLeft(Object value) {
    return 0;
  }

  @override
  String getBackgroundColor(Object value) {
    return null;
  }
}
