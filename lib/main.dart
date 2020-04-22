import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_passage/bible_passage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/setting_bloc/settings_bloc.dart';
import 'data/repository/bible_repository.dart';
import 'data/repository/hive_repository.dart';
import 'ui/app_widget.dart';
import 'ui/bible_page/bloc/bible_page/bible_page_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path =
      await getApplicationDocumentsDirectory().then((value) => value.path);
  Hive.init(path);

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
        BlocProvider<BiblePassageBloc>(
          create: (context) => BiblePassageBloc(
              hiveRepository: context.repository<HiveRepository>())
            ..add(PassageHighlightedFetched()),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) =>
              SettingsBloc(hiveRepository: context.repository<HiveRepository>())
                ..add(SettingsFetched()),
        )
      ], child: AppWidget()),
    ),
  );
}
