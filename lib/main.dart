import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/hive_bloc/hive_bloc.dart';
import 'core/setting_bloc/settings_bloc.dart';
import 'data/repository/bible_repository.dart';
import 'data/repository/hive_repository.dart';
import 'ui/app_widget.dart';
import 'ui/bible_page/bible_reader_page/bloc/passage/passage_bloc.dart';
import 'ui/bible_page/bloc/bible_page/bible_page_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BibleRepository>(
          create: (context) => BibleRepository(),
        ),
        RepositoryProvider<HiveRepository>(
          create: (context) => HiveRepository(),
        )
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<BiblePageBloc>(
          create: (context) => BiblePageBloc(
            bibleRepository: context.repository<BibleRepository>(),
          )..add(BiblePageStarted()),
        ),
        BlocProvider<HiveBloc>(
          create: (context) => HiveBloc()..add(HiveConfigured()),
        ),
        BlocProvider<PassageBloc>(
          create: (context) =>
              PassageBloc(hiveRepository: context.repository<HiveRepository>())
                ..add(PassageHighlightedFetched()),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        )
      ], child: AppWidget()),
    ),
  );
}
