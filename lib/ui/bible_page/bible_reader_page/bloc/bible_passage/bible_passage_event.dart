part of 'bible_passage_bloc.dart';

abstract class BiblePassageEvent extends Equatable {
  const BiblePassageEvent();
}

class PassageHighlightedFetched extends BiblePassageEvent {
  @override
  List<Object> get props => [];
}

class BiblePassageHighlighted extends BiblePassageEvent {
  final BibleChapterContent contentHighlighted;

  BiblePassageHighlighted({this.contentHighlighted});

  @override
  List<Object> get props => [contentHighlighted];
}

class BiblePassageHighlightRemoved extends BiblePassageEvent {
  final BibleChapterContent contentHighlighted;
  BiblePassageHighlightRemoved({
    this.contentHighlighted,
  });

  @override
  List<Object> get props => [contentHighlighted];
}
