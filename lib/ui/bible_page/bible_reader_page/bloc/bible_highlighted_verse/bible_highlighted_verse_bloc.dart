import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:ccfii_read_obey_succeed/data/model/highlighted_content.dart';
import 'package:equatable/equatable.dart';

import 'package:ccfii_read_obey_succeed/data/model/bible_chapter_content.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_passage/bible_passage_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'bible_highlighted_verse_event.dart';
part 'bible_highlighted_verse_state.dart';

class BibleHighlightedVerseBloc
    extends Bloc<BibleHighlightedVerseEvent, BibleHighlightedVerseState> {
  final BiblePassageBloc biblePassageBloc;
  StreamSubscription biblePassageSub;
  bool isHighlighted = false;
  HighlightedContent highlightedGroup;
  Color highlightColor;
  BibleHighlightedVerseBloc({
    @required this.biblePassageBloc,
  });

  @override
  Future<void> close() {
    biblePassageSub.cancel();
    return super.close();
  }

  @override
  BibleHighlightedVerseState get initialState => BibleVerseNotHighlighted();

  @override
  Stream<BibleHighlightedVerseState> mapEventToState(
    BibleHighlightedVerseEvent event,
  ) async* {
    if (event is BibleHighlightedVerseChecked) {
      biblePassageSub = biblePassageBloc.listen((state) async {
        if (state is BiblePassageShowHighlight) {
          final isHighlighted = await _checkForHighlightedVerses(
              state.highlightedVerses, event.verse);
          if (isHighlighted) {
            add(BibleHighlightedVerseFound(
              highlightColor: highlightColor,
              highlightedContent: highlightedGroup,
            ));
          } else {
            add(BibleHighlightedVerseNotFound());
          }
        } else if (state is BiblePassageHighlightEmpty) {
          add(BibleHighlightedVerseNotFound());
        }
      });
    } else if (event is BibleHighlightedVerseFound) {
      yield BibleVerseHighlighted(
        highlightColor: highlightColor,
        highlightedContent: highlightedGroup,
      );
    } else if (event is BibleHighlightedVerseNotFound) {
      yield BibleVerseNotHighlighted();
    }
  }

  Future<bool> _checkForHighlightedVerses(
      List<HighlightedContent> highlightedContents,
      BibleChapterContent verse) async {
    bool isHighlighted = false;
    for (final content in highlightedContents) {
      final versesFound = content.chapterContents.where((element) =>
          element.bookId == verse.bookId &&
          element.chapterNumber == verse.chapterNumber &&
          element.verse == verse.verse);
      if (versesFound.isNotEmpty) {
        isHighlighted = true;
        highlightedGroup = content;
        final highlighColorRgb = content.highlightColor;
        highlightColor = (highlighColorRgb != null)
            ? Color.fromRGBO(highlighColorRgb[0], highlighColorRgb[1],
                highlighColorRgb[2], 1)
            : Colors.yellow;
        break;
      }
    }

    return isHighlighted;
  }
}
