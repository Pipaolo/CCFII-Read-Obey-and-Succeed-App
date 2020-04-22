import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../data/model/bible_book.dart';
import '../../../../data/model/bible_chapter.dart';
import '../../../../data/model/bible_chapter_content.dart';
import '../../../../data/repository/bible_repository.dart';

part 'bible_book_event.dart';
part 'bible_book_state.dart';

class BibleBookBloc extends Bloc<BibleBookEvent, BibleBookState> {
  final BibleRepository bibleRepository;
  BibleBookBloc({
    @required this.bibleRepository,
  });
  @override
  BibleBookState get initialState => BibleBookInitial();

  @override
  Stream<BibleBookState> mapEventToState(
    BibleBookEvent event,
  ) async* {
    if (event is BibleBookPressed) {
      yield BibleBookLoading();
      try {
        final Map<String, dynamic> bookRaw =
            await bibleRepository.fetchRawBookDataFromJson(
                'assets/bible_database/books/${event.bookId}.json');
        final book = BibleBook(
            title: bookRaw['title'],
            category: bookRaw['category'],
            numberOfChapters: bookRaw['number_of_chapters'],
            id: bookRaw['id'],
            chapters: (bookRaw['chapters'] as List<dynamic>)
                .map((chapterRaw) => BibleChapter(
                    title: chapterRaw['chapter_title'],
                    number: chapterRaw['chapter_number'],
                    content: (chapterRaw['chapter_content'] as List<dynamic>)
                        .map((contentRaw) => BibleChapterContent(
                            bookId: bookRaw['id'],
                            chapterNumber: chapterRaw['chapter_number'],
                            passageTitle: contentRaw['passage_title'],
                            text: contentRaw['text'],
                            verse: int.tryParse(contentRaw['verse'])))
                        .toList()))
                .toList());

        yield BibleBookSuccess(
          bibleBook: book,
        );
      } catch (e) {
        print(e);
        yield BibleBookError();
      }
    }
  }
}
