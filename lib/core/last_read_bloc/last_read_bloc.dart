import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ccfii_read_obey_succeed/data/repository/hive_repository.dart';
import 'package:flutter/foundation.dart';

part 'last_read_event.dart';
part 'last_read_state.dart';

class LastReadBloc extends Bloc<LastReadEvent, LastReadState> {
  final HiveRepository hiveRepository;
  LastReadBloc({
    @required this.hiveRepository,
  });
  @override
  LastReadState get initialState => LastReadInitial();

  @override
  Stream<LastReadState> mapEventToState(
    LastReadEvent event,
  ) async* {
    if (event is LastReadFetched) {}
  }
}
