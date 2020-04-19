import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../data/model/bible_directory.dart';
import '../../../../data/repository/bible_repository.dart';

part 'bible_page_event.dart';
part 'bible_page_state.dart';

class BiblePageBloc extends Bloc<BiblePageEvent, BiblePageState> {
  final BibleRepository bibleRepository;

  BiblePageBloc({
    @required this.bibleRepository,
  });

  @override
  BiblePageState get initialState => BiblePageInitial();

  List<BibleDirectory> bibleDirectories = [];

  @override
  Stream<BiblePageState> mapEventToState(
    BiblePageEvent event,
  ) async* {
    if (event is BiblePageStarted) {
      yield BiblePageLoading();
      try {
        final bibleRaw = await bibleRepository
            .fetchRawDataFromJson('assets/bible_database/bible_directory.json');
        bibleDirectories = bibleRaw.map((rawDirectory) {
          return BibleDirectory(
            category: rawDirectory['category'],
            id: rawDirectory['id'],
            index: rawDirectory['index'],
            title: rawDirectory['title'],
          );
        }).toList();

        yield BiblePageSuccess(
          oldTestamentDirectories: bibleDirectories
              .where((element) => element.category.contains('ot'))
              .toList(),
          newTestamentDirectories: bibleDirectories
              .where((element) => element.category.contains('nt'))
              .toList(),
        );
      } catch (e) {
        yield BiblePageError();
      }
    }
  }
}
