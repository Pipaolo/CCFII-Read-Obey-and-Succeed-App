import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ccfii_read_obey_succeed/data/model/highlighted_content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/bible_chapter_content.dart';
import '../../../../../data/repository/hive_repository.dart';

part 'passage_event.dart';
part 'passage_state.dart';

class PassageBloc extends Bloc<PassageEvent, PassageState> {
  final HiveRepository hiveRepository;
  PassageBloc({
    @required this.hiveRepository,
  });
  @override
  PassageState get initialState => PassageInitial();

  @override
  Stream<PassageState> mapEventToState(
    PassageEvent event,
  ) async* {
    if (event is PassageHighlighted) {
      await hiveRepository.addHighlightedVerses(event.contentHighlighted);
      final highlightedVerses = await hiveRepository.fetchHighlightedVerses();

      yield PassageShowHighlight(
          highlightedVerses: highlightedVerses, isAdded: true);
    } else if (event is PassageHighlightRemoved) {
      await hiveRepository.removeHighlightedVerse(event.contentHighlighted);
      final highlightedVerses = await hiveRepository.fetchHighlightedVerses();
      if (highlightedVerses.isEmpty) {
        yield PassageHighlightEmpty();
      } else {
        yield PassageShowHighlight(
            highlightedVerses: highlightedVerses, isAdded: false);
      }
    } else if (event is PassageHighlightedFetched) {
      try {
        final highlightedVerses = await hiveRepository.fetchHighlightedVerses();
        if (highlightedVerses.length != 0) {
          yield PassageShowHighlight(highlightedVerses: highlightedVerses);
        } else {
          yield PassageHighlightEmpty();
        }
      } catch (e) {
        yield PassageError(errorText: e.toString());
      }
    }
  }
}
