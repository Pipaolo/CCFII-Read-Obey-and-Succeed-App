import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  ThemeData currentTheme;
  @override
  SettingsState get initialState => SettingsInitial();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is DarkThemePressed) {
      currentTheme = ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
        ),
      );
      yield SettingsUpdated(isDarkMode: true);
    } else if (event is LightThemePressed) {
      currentTheme = ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.black),
        ),
      );
      yield SettingsUpdated(isDarkMode: false);
    }
  }
}
