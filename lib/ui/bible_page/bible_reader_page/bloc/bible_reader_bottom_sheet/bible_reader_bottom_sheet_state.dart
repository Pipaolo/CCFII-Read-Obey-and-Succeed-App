part of 'bible_reader_bottom_sheet_bloc.dart';

abstract class BibleReaderBottomSheetState extends Equatable {
  const BibleReaderBottomSheetState();
}

class BibleReaderBottomSheetHidden extends BibleReaderBottomSheetState {
  @override
  List<Object> get props => [];
}

class ShowBibleReaderBottomSheet extends BibleReaderBottomSheetState {
  final HighlightedContent content;
  final Color color;
  ShowBibleReaderBottomSheet({
    this.content,
    this.color,
  });

  @override
  List<Object> get props => [content, color];
}
