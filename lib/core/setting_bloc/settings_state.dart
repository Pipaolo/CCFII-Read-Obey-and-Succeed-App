part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  @override
  List<Object> get props => [];
}

class ShowUpdatedSettings extends SettingsState {
  final bool isDarkMode;
  final ReaderFontSizes textFontSizes;
  final ReaderFontStyles textFontStyles;

  ShowUpdatedSettings({
    @required this.isDarkMode,
    @required this.textFontSizes,
    @required this.textFontStyles,
  });

  @override
  List<Object> get props => [isDarkMode, textFontSizes, textFontStyles];
}
