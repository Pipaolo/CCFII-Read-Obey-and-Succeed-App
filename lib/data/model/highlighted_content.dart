import 'package:flutter/foundation.dart';

import 'bible_chapter_content.dart';

class HighlightedContent {
  final List<BibleChapterContent> chapterContents;
  final List<int> highlightColor;
  HighlightedContent({
    this.chapterContents,
    this.highlightColor,
  });

  HighlightedContent copyWith({
    List<BibleChapterContent> chapterContents,
    List<int> highlightColor,
  }) {
    return HighlightedContent(
      chapterContents: chapterContents ?? this.chapterContents,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }

  @override
  String toString() =>
      'HighlightedContent(chapterContents: $chapterContents, highlightColor: $highlightColor)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HighlightedContent &&
        listEquals(o.chapterContents, chapterContents) &&
        listEquals(o.highlightColor, highlightColor);
  }

  @override
  int get hashCode => chapterContents.hashCode ^ highlightColor.hashCode;
}
