part of 'last_read_bloc.dart';

abstract class LastReadState extends Equatable {
  const LastReadState();
}

class LastReadInitial extends LastReadState {
  @override
  List<Object> get props => [];
}
