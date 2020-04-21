part of 'bible_reader_bottom_sheet_bloc.dart';

abstract class BibleReaderBottomSheetEvent extends Equatable {
  const BibleReaderBottomSheetEvent();
}

class PassageSheetShowed extends BibleReaderBottomSheetEvent {
  final BibleChapterContent verse;
  PassageSheetShowed({
    @required this.verse,
  });
  @override
  List<Object> get props => [];
}

class PassageSheetClosed extends BibleReaderBottomSheetEvent {
  @override
  List<Object> get props => [];
}

class PassageHighlightColorChanged extends BibleReaderBottomSheetEvent {
  final Color color;
  PassageHighlightColorChanged({
    @required this.color,
  });
  @override
  List<Object> get props => [color];
}
