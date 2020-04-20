// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_chapter_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BibleChapterContent _$_$_BibleChapterContentFromJson(
    Map<String, dynamic> json) {
  return _$_BibleChapterContent(
    bookId: json['bookId'] as String,
    chapterNumber: json['chapterNumber'] as int,
    passageTitle: json['passageTitle'] as String,
    verse: json['verse'] as int,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$_$_BibleChapterContentToJson(
        _$_BibleChapterContent instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'chapterNumber': instance.chapterNumber,
      'passageTitle': instance.passageTitle,
      'verse': instance.verse,
      'text': instance.text,
    };
