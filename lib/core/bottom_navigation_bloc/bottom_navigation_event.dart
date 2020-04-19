part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  BottomNavigationEvent();
}

class BottomNavigationItemPressed extends BottomNavigationEvent {
  final int index;
  BottomNavigationItemPressed({
    this.index,
  });
  @override
  List<Object> get props => [index];
}
