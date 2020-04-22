part of 'last_read_bloc.dart';

abstract class LastReadEvent extends Equatable {
  const LastReadEvent();
}

class LastReadFetched extends LastReadEvent {
  @override
  List<Object> get props => [];
}
