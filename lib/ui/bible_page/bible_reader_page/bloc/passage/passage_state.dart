part of 'passage_bloc.dart';

abstract class PassageState {
  const PassageState();
}

class PassageInitial extends PassageState {}

class PassageShowHighlight extends PassageState {
  final List<HighlightedContent> highlightedVerses;
  final bool isAdded;

  PassageShowHighlight({
    this.highlightedVerses,
    this.isAdded,
  });

  PassageShowHighlight copyWith({
    List<BibleChapterContent> highlightedVerses,
    bool isAdded,
  }) {
    return PassageShowHighlight(
      highlightedVerses: highlightedVerses ?? this.highlightedVerses,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}

class PassageHighlightEmpty extends PassageState {}

class PassageError extends PassageState {
  final String errorText;
  PassageError({
    this.errorText,
  });
}
