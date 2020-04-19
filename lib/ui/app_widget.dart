import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/data/repository/bible_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/router.gr.dart';
import 'bible_page/bloc/bible_page/bible_page_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BibleRepository>(
          create: (context) => BibleRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BiblePageBloc>(
            create: (context) => BiblePageBloc(
              bibleRepository: context.repository<BibleRepository>(),
            )..add(
                BiblePageStarted(),
              ),
          )
        ],
        child: MaterialApp(
          builder: ExtendedNavigator<Router>(
            router: Router(),
          ),
        ),
      ),
    );
  }
}
