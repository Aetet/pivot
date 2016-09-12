import 'dart:math';

import 'package:pivot/src/rendering/grid_rendering_context.dart';
import 'package:pivot/src/rendering/grid_rendering_options.dart';

class GridRenderingService {
  final GridRenderingContext _context;
  final GridRenderingOptions _options;
  int _spaceWidth;

  GridRenderingService(this._context, this._options);

  num getTextHeight(String text, num width) {
    return _getLinesOfTextCount(text, width) * _options.lineHeight;
  }

  int _getLinesOfTextCount(String text, num width) {
    int linesOfText = 0;
    List<String> paragraphs = text.split('\n');

    for (String paragraph in paragraphs) {
      linesOfText += _getLineBreaksCount(paragraph, width);
    }

    return linesOfText;
  }

  int _getLineBreaksCount(String paragraph, num availableWidth) {
    int linesBreaks = 0;
    num currentPosition = 0;
    List<String> words = paragraph.split(' ');

    _spaceWidth = _spaceWidth ?? _context.getTextWidth(' ');

    for (String word in words) {
      num wordWidth = _context.getTextWidth(word);

      // if word exceeds available width, move to next line
      if (currentPosition + wordWidth > availableWidth && currentPosition > 0) {
        linesBreaks++;
        currentPosition = 0;
      }

      // split long word to several lines of text, each on new line
      while (wordWidth > 0) {
        num currentPartWidth = min(wordWidth, availableWidth);
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
