import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:ccfii_read_obey_succeed/data/model/highlighted_content.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_passage/bible_passage_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/bible_chapter_content.dart';
import '../../../../../data/repository/hive_repository.dart';

part 'bible_reader_bottom_sheet_event.dart';
part 'bible_reader_bottom_sheet_state.dart';

class BibleReaderBottomSheetBloc
    extends Bloc<BibleReaderBottomSheetEvent, BibleReaderBottomSheetState> {
  final HiveRepository hiveRepository;
  final BiblePassageBloc passageBloc;
  BibleChapterContent selectedVerse;
  BibleReaderBottomSheetBloc({
    @required this.passageBloc,
    @required this.hiveRepository,
  });

  @override
  BibleReaderBottomSheetState get initialState =>
      BibleReaderBottomSheetHidden();

  @override
  Stream<BibleReaderBottomSheetState> mapEventToState(
    BibleReaderBottomSheetEvent event,
  ) async* {
    if (event is PassageSheetShowed) {
      Color highlightColor;
      //If the highlighted group has a color then compute
      if (event.highlightedGroup != null) {
        final highlightedColorRgb = event.highlightedGroup.highlightColor;
        highlightColor = (highlightedColorRgb != null)
            ? Color.fromRGBO(highlightedColorRgb[0], highlightedColorRgb[1],
                highlightedColorRgb[2], 1)
            : Colors.yellow;
      }

      selectedVerse = event.verse;
      yield ShowBibleReaderBottomSheet(
        content: event.highlightedGroup,
        color: highlightColor,
      );
    } else if (event is PassageHighlightColorChanged) {
      await hiveRepository.changeHighlightColor(selectedVerse, event.color);
      passageBloc..add(PassageHighlightedFetched());
    } else if (event is PassageSheetClosed) {
      selectedVerse = null;
      yield BibleReaderBottomSheetHidden();
    }
  }
}
