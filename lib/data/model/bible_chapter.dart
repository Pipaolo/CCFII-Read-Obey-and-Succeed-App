import 'package:freezed_annotation/freezed_annotation.dart';

import 'bible_chapter_content.dart';

part 'bible_chapter.freezed.dart';

@freezed
abstract class BibleChapter with _$BibleChapter {
  const factory BibleChapter({
    String title,
    int number,
    List<BibleChapterContent> content,
  }) = _BibleChapter;
}
