import 'dart:math';

import 'package:angular2/di.dart';
import 'package:pivot/src/rendering/grid_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_options.dart';

@Injectable()
class GridRenderingService {
  final GridRenderingContext _renderingContext;
  final GridRenderingOptions _renderingOptions;
  int _spaceWidth;

  GridRenderingService(this._renderingContext, this._renderingOptions);

  num getTextHeight(String text, num contentWidth) {
    return _getLinesOfTextCount(text, contentWidth) * _renderingOptions.lineHeight;
  }

  int _getLinesOfTextCount(String text, num contentWidth) {
    int linesOfText = 0;
    List<String> paragraphs = text.split('\n');

    for (String paragraph in paragraphs) {
      linesOfText += _getLineBreaksCount(paragraph, contentWidth);
    }

    return linesOfText;
  }

  int _getLineBreaksCount(String paragraph, num contentWidth) {
    int linesBreaks = 0;
    num currentPosition = 0;
    List<String> words = paragraph.split(' ');

    _spaceWidth = _spaceWidth ?? _renderingContext.getTextWidth(' ');

    for (String word in words) {
      num wordWidth = _renderingContext.getTextWidth(word);

      // if word exceeds available width, move to next line
      if (currentPosition + wordWidth > contentWidth && currentPosition > 0) {
        linesBreaks++;
        currentPosition = 0;
      }

      // split long word to several lines of text, each on new line
      while (wordWidth > 0) {
        num currentPartWidth = min(wordWidth, contentWidth);
        num remainingPartsWidth = wordWidth - currentPartWidth;

        currentPosition += currentPartWidth;
        if (remainingPartsWidth > 0) {
          linesBreaks++;
          currentPosition = 0;

          // compensate line break on symbol position
          remainingPartsWidth += wordWidth / word.length;
        }

        wordWidth = remainingPartsWidth;
      }

      // words in sentence are followed by space
      if (words.length > 0) {
        currentPosition += _spaceWidth;
      }
    }

    return linesBreaks;
  }
}
