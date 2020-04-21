import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/core/setting_bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          theme: context.bloc<SettingsBloc>().currentTheme,
          builder: ExtendedNavigator<Router>(
            router: Router(),
          ),
        );
      },
    );
  }
}
