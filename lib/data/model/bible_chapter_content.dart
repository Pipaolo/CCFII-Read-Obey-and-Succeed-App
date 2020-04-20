import 'package:freezed_annotation/freezed_annotation.dart';
part 'bible_chapter_content.freezed.dart';
part 'bible_chapter_content.g.dart';

@freezed
abstract class BibleChapterContent with _$BibleChapterContent {
  const factory BibleChapterContent({
    String bookId,
    int chapterNumber,
    String passageTitle,
    int verse,
    String text,
  }) = _BibleChapterContent;

  factory BibleChapterContent.fromJson(Map<String, dynamic> json) =>
      _$BibleChapterContentFromJson(json);
}
