import 'package:freezed_annotation/freezed_annotation.dart';

import 'bible_chapter.dart';

part 'bible_book.freezed.dart';

@freezed
abstract class BibleBook with _$BibleBook {
  const factory BibleBook({
    String title,
    String category,
    int numberOfChapters,
    String id,
    List<BibleChapter> chapters,
  }) = _BibleBook;
}
