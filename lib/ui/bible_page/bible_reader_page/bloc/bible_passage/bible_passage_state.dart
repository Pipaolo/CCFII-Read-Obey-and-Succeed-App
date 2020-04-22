part of 'bible_passage_bloc.dart';

abstract class BiblePassageState {
  const BiblePassageState();
}

class BiblePassageInitial extends BiblePassageState {}

class BiblePassageShowHighlight extends BiblePassageState {
  final List<HighlightedContent> highlightedVerses;
  final bool isAdded;

  BiblePassageShowHighlight({
    this.highlightedVerses,
    this.isAdded,
  });

  BiblePassageShowHighlight copyWith({
    List<BibleChapterContent> highlightedVerses,
    bool isAdded,
  }) {
    return BiblePassageShowHighlight(
      highlightedVerses: highlightedVerses ?? this.highlightedVerses,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}

class BiblePassageHighlightEmpty extends BiblePassageState {}

class BiblePassageError extends BiblePassageState {
  final String errorText;
  BiblePassageError({
    this.errorText,
  });
}
