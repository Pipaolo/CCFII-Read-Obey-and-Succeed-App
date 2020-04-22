import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ccfii_read_obey_succeed/data/model/highlighted_content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/bible_chapter_content.dart';
import '../../../../../data/repository/hive_repository.dart';

part 'bible_passage_event.dart';
part 'bible_passage_state.dart';

class BiblePassageBloc extends Bloc<BiblePassageEvent, BiblePassageState> {
  final HiveRepository hiveRepository;
  BiblePassageBloc({
    @required this.hiveRepository,
  });
  @override
  BiblePassageState get initialState => BiblePassageInitial();

  @override
  Stream<BiblePassageState> mapEventToState(
    BiblePassageEvent event,
  ) async* {
    if (event is BiblePassageHighlighted) {
      await hiveRepository.addHighlightedVerses(event.contentHighlighted);
      final highlightedVerses = await hiveRepository.fetchHighlightedVerses();

      yield BiblePassageShowHighlight(
          highlightedVerses: highlightedVerses, isAdded: true);
    } else if (event is BiblePassageHighlightRemoved) {
      await hiveRepository.removeHighlightedVerse(event.contentHighlighted);
      final highlightedVerses = await hiveRepository.fetchHighlightedVerses();

      if (highlightedVerses.isEmpty) {
        yield BiblePassageHighlightEmpty();
      } else {
        yield BiblePassageShowHighlight(
            highlightedVerses: highlightedVerses, isAdded: false);
      }
    } else if (event is PassageHighlightedFetched) {
      try {
        final highlightedVerses = await hiveRepository.fetchHighlightedVerses();
        if (highlightedVerses.length != 0) {
          yield BiblePassageShowHighlight(highlightedVerses: highlightedVerses);
        } else {
          yield BiblePassageHighlightEmpty();
        }
      } catch (e) {
        yield BiblePassageError(errorText: e.toString());
      }
    }
  }
}
