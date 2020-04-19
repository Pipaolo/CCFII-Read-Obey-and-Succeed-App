part of 'bible_book_bloc.dart';

abstract class BibleBookEvent extends Equatable {
  const BibleBookEvent();
}

class BibleBookPressed extends BibleBookEvent {
  final String bookId;
  BibleBookPressed({
    this.bookId,
  });
  @override
  List<Object> get props => [bookId];
}
