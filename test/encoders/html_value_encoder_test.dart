import 'package:pivot/pivot.dart';
import 'package:test/test.dart';

void main() {
  HtmlValueEncoder encoder = new HtmlValueEncoder();

  test('should encode text as html', () {
    String text = '<script>alert("xss")</script>';
    String html = '&lt;script&gt;alert("xss")&lt;/script&gt;';

    expect(encoder.getHtml(text, null), html);
  });
}
