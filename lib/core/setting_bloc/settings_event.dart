part of 'settings_bloc.dart';

enum ReaderFontSizes {
  large,
  normal,
  small,
}

enum ReaderFontStyles {
  normal,
  modern,
  old,
}

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsUpdated extends SettingsEvent {
  final bool isDarkModeEnabled;
  final ReaderFontSizes textFontSize;
  final ReaderFontStyles textFontStyles;
  SettingsUpdated({
    this.isDarkModeEnabled,
    this.textFontSize,
    this.textFontStyles,
  });

  @override
  List<Object> get props => [];
}

class SettingsFetched extends SettingsEvent {
  @override
  List<Object> get props => [];
}
