import 'package:freezed_annotation/freezed_annotation.dart';
part 'bible_chapter_content.freezed.dart';

@freezed
abstract class BibleChapterContent with _$BibleChapterContent {
  const factory BibleChapterContent({
    String passageTitle,
    int verse,
    String text,
  }) = _BibleChapterContent;
}
