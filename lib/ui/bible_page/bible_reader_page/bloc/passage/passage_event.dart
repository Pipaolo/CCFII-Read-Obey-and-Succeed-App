part of 'passage_bloc.dart';

abstract class PassageEvent extends Equatable {
  const PassageEvent();
}

class PassageHighlightedFetched extends PassageEvent {
  @override
  List<Object> get props => [];
}

class PassageHighlighted extends PassageEvent {
  final BibleChapterContent contentHighlighted;

  PassageHighlighted({this.contentHighlighted});

  @override
  List<Object> get props => [contentHighlighted];
}

class PassageHighlightRemoved extends PassageEvent {
  final BibleChapterContent contentHighlighted;
  PassageHighlightRemoved({
    this.contentHighlighted,
  });

  @override
  List<Object> get props => [contentHighlighted];
}
