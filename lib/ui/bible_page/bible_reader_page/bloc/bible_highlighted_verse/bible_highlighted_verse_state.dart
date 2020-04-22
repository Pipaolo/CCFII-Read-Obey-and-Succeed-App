part of 'bible_highlighted_verse_bloc.dart';

abstract class BibleHighlightedVerseState extends Equatable {
  const BibleHighlightedVerseState();
}

class BibleVerseNotHighlighted extends BibleHighlightedVerseState {
  @override
  List<Object> get props => [];
}

class BibleVerseHighlighted extends BibleHighlightedVerseState {
  final HighlightedContent highlightedContent;
  final Color highlightColor;
  BibleVerseHighlighted({
    this.highlightedContent,
    this.highlightColor,
  });
  @override
  List<Object> get props => [highlightColor, highlightedContent];
}
