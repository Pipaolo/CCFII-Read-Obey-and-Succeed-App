import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/data/model/settings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/repository/hive_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final HiveRepository hiveRepository;
  ThemeData currentTheme;
  SettingsBloc({
    @required this.hiveRepository,
  });
  @override
  SettingsState get initialState => SettingsInitial();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsUpdated) {
      if (event.isDarkModeEnabled) {
        currentTheme = ThemeData(
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
          primaryColor: ccfiiDarkRed,
          accentColor: ccfiiDarkOrange,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline1: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),
          ),
        );

        //Store Updated Settings
        await hiveRepository.updateSettings(Settings(
          isDarkModeEnabled: true,
          textFontSize: event.textFontSize,
          textFontStyle: event.textFontStyles,
        ));

        yield ShowUpdatedSettings(
          isDarkMode: true,
          textFontSizes: event.textFontSize,
          textFontStyles: event.textFontStyles,
        );
      } else {
        currentTheme = ThemeData(
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          primaryColor: Color(0xffC30000),
          accentColor: Color(0xffFFD585),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black),
            headline5: TextStyle(color: Colors.black),
            headline4: TextStyle(color: Colors.black),
            headline1: TextStyle(color: Colors.black),
            bodyText1: TextStyle(color: Colors.black),
          ),
        );

        //Store Updated Settings
        await hiveRepository.updateSettings(Settings(
          isDarkModeEnabled: false,
          textFontSize: event.textFontSize,
          textFontStyle: event.textFontStyles,
        ));

        yield ShowUpdatedSettings(
          isDarkMode: false,
          textFontSizes: event.textFontSize,
          textFontStyles: event.textFontStyles,
        );
      }
    } else if (event is SettingsFetched) {
      final currentSettings = await hiveRepository.fetchSettings();
      if (currentSettings.isDarkModeEnabled) {
        add(SettingsUpdated(
          isDarkModeEnabled: true,
          textFontSize: currentSettings.textFontSize,
          textFontStyles: currentSettings.textFontStyle,
        ));
      } else {
        add(SettingsUpdated(
          isDarkModeEnabled: false,
          textFontSize: currentSettings.textFontSize,
          textFontStyles: currentSettings.textFontStyle,
        ));
      }
    }
  }
}
