import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'hive_event.dart';
part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  @override
  HiveState get initialState => HiveState.initial;

  @override
  Stream<HiveState> mapEventToState(
    HiveEvent event,
  ) async* {
    if (event is HiveConfigured) {
      yield HiveState.loading;
      try {
        final path = await getApplicationDocumentsDirectory()
            .then((value) => value.path);
        Hive.init(path);

        yield HiveState.success;
      } catch (e) {
        yield HiveState.error;
      }
    }
  }
}
