part of 'bible_page_bloc.dart';

abstract class BiblePageEvent extends Equatable {
  const BiblePageEvent();
}

class BiblePageStarted extends BiblePageEvent {
  @override
  List<Object> get props => [];
}
