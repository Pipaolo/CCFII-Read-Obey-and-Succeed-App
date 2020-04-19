part of 'bible_book_bloc.dart';

abstract class BibleBookState extends Equatable {
  const BibleBookState();
}

class BibleBookInitial extends BibleBookState {
  @override
  List<Object> get props => [];
}

class BibleBookLoading extends BibleBookState {
  @override
  List<Object> get props => [];
}

class BibleBookSuccess extends BibleBookState {
  final BibleBook bibleBook;
  BibleBookSuccess({
    this.bibleBook,
  });
  @override
  List<Object> get props => [bibleBook];
}

class BibleBookError extends BibleBookState {
  @override
  List<Object> get props => [];
}
