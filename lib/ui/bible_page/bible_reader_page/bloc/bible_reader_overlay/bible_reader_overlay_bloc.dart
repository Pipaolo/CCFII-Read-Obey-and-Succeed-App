import 'dart:async';

import 'package:bloc/bloc.dart';

part 'bible_reader_overlay_event.dart';
part 'bible_reader_overlay_state.dart';

class BibleReaderOverlayBloc
    extends Bloc<BibleReaderOverlayEvent, BibleReaderOverlayState> {
  @override
  BibleReaderOverlayState get initialState =>
      BibleReaderOverlayState.overlayShown;

  @override
  Stream<BibleReaderOverlayState> mapEventToState(
    BibleReaderOverlayEvent event,
  ) async* {
    switch (event) {
      case BibleReaderOverlayEvent.overlayShowed:
        yield BibleReaderOverlayState.overlayShown;
        break;
      case BibleReaderOverlayEvent.overlayHide:
        yield BibleReaderOverlayState.overlayHidden;
        break;
    }
  }
}
