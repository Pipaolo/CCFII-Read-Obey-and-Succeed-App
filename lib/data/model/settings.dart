import '../../core/setting_bloc/settings_bloc.dart';

class Settings {
  final bool isDarkModeEnabled;
  final ReaderFontSizes textFontSize;
  final ReaderFontStyles textFontStyle;
  Settings({
    this.isDarkModeEnabled,
    this.textFontSize,
    this.textFontStyle,
  });

  Settings copyWith({
    bool isDarkModeEnabled,
    ReaderFontSizes textFontSize,
    ReaderFontStyles textFontStyle,
  }) {
    return Settings(
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
      textFontSize: textFontSize ?? this.textFontSize,
      textFontStyle: textFontStyle ?? this.textFontStyle,
    );
  }

  @override
  String toString() =>
      'Settings(isDarkModeEnabled: $isDarkModeEnabled, textFontSize: $textFontSize, textFontStyle: $textFontStyle)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Settings &&
        o.isDarkModeEnabled == isDarkModeEnabled &&
        o.textFontSize == textFontSize &&
        o.textFontStyle == textFontStyle;
  }

  @override
  int get hashCode =>
      isDarkModeEnabled.hashCode ^
      textFontSize.hashCode ^
      textFontStyle.hashCode;
}
