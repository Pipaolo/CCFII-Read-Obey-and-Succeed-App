part of 'bible_page_bloc.dart';

abstract class BiblePageState extends Equatable {
  const BiblePageState();
}

class BiblePageInitial extends BiblePageState {
  @override
  List<Object> get props => [];
}

class BiblePageLoading extends BiblePageState {
  @override
  List<Object> get props => [];
}

class BiblePageSuccess extends BiblePageState {
  final List<BibleDirectory> oldTestamentDirectories;
  final List<BibleDirectory> newTestamentDirectories;
  BiblePageSuccess({
    this.oldTestamentDirectories,
    this.newTestamentDirectories,
  });
  @override
  List<Object> get props => [
        oldTestamentDirectories,
        newTestamentDirectories,
      ];
}

class BiblePageError extends BiblePageState {
  @override
  List<Object> get props => [];
}
