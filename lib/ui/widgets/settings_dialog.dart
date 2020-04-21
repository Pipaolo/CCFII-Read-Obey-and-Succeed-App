import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/core/setting_bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        bool isDarkModeEnabled = false;

        if (state is ShowUpdatedSettings) {
          isDarkModeEnabled = state.isDarkMode;
        }

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildDarkModeSwitch(context, isDarkModeEnabled),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildDarkModeSwitch(BuildContext context, bool isDarkModeEnabled) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.wb_sunny),
          Switch(
            onChanged: (value) {
              print(value);
              if (value) {
                context.bloc<SettingsBloc>()
                  ..add(SettingsUpdated(
                      isDarkModeEnabled: true,
                      textFontSize: ReaderFontSizes.normal,
                      textFontStyles: ReaderFontStyles.normal));
              } else {
                context.bloc<SettingsBloc>()
                  ..add(SettingsUpdated(
                      isDarkModeEnabled: false,
                      textFontSize: ReaderFontSizes.normal,
                      textFontStyles: ReaderFontStyles.normal));
              }
            },
            value: isDarkModeEnabled,
            activeColor: ccfiiRed,
            activeTrackColor: ccfiiRed.withOpacity(0.5),
            inactiveThumbColor: ccfiiLightOrange,
            inactiveTrackColor: ccfiiLightOrange.withOpacity(0.5),
          ),
          Icon(FontAwesome.moon_o),
        ],
      );
}
