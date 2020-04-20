part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingsUpdated extends SettingsState {
  final bool isDarkMode;
  SettingsUpdated({
    this.isDarkMode,
  });
  @override
  List<Object> get props => [isDarkMode];
}
