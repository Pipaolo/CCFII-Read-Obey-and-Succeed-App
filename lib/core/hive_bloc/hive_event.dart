part of 'hive_bloc.dart';

abstract class HiveEvent extends Equatable {
  const HiveEvent();
}

class HiveConfigured extends HiveEvent {
  @override
  List<Object> get props => [];
}
