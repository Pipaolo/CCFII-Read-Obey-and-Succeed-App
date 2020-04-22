part of 'bible_highlighted_verse_bloc.dart';

abstract class BibleHighlightedVerseEvent extends Equatable {
  const BibleHighlightedVerseEvent();
}

class BibleHighlightedVerseChecked extends BibleHighlightedVerseEvent {
  final BibleChapterContent verse;

  BibleHighlightedVerseChecked({this.verse});

  @override
  List<Object> get props => [verse];
}

class BibleHighlightedVerseFound extends BibleHighlightedVerseEvent {
  final HighlightedContent highlightedContent;
  final Color highlightColor;
  BibleHighlightedVerseFound({
    this.highlightedContent,
    this.highlightColor,
  });
  @override
  List<Object> get props => [highlightedContent, highlightColor];
}

class BibleHighlightedVerseNotFound extends BibleHighlightedVerseEvent {
  @override
  List<Object> get props => [];
}
