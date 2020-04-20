part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class DarkThemePressed extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class LightThemePressed extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class ColorThemeFetched extends SettingsEvent {
  @override
  List<Object> get props => [];
}
