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
                .map((e) => BibleChapter(
                    title: e['chapter_title'],
                    number: e['chapter_number'],
                    content: (e['chapter_content'] as List<dynamic>)
                        .map((e) => BibleChapterContent(
                            passageTitle: e['passage_title'],
                            text: e['text'],
                            verse: int.parse(e['verse'])))
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
