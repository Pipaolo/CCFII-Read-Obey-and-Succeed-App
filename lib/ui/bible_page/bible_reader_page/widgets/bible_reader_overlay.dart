import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../../routes/router.gr.dart';
import '../../../widgets/settings_dialog.dart';

class BibleReaderOverlay extends StatelessWidget {
  final String bookTitle;
  final String chapterNumber;
  final bool isShown;
  const BibleReaderOverlay({
    Key key,
    @required this.bookTitle,
    @required this.chapterNumber,
    @required this.isShown,
  }) : super(key: key);

  _showSettingsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SettingsDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildTopOverlay(context),
        // _buildBottomOverlay(context),
      ],
    );
  }

  _buildBottomOverlay(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: (isShown) ? 1 : 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          height: kToolbarHeight,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () => ExtendedNavigator.of(context).pop(),
                ),
              ),
              // Center(
              //   child: BlocBuilder<SettingsBloc, SettingsState>(
              //     builder: (context, state) {
              //       bool isDarkMode = false;
              //       if (state is ShowUpdatedSettings) {
              //         isDarkMode = state.isDarkMode;
              //       }
              //       return Switch(
              //           onChanged: (value) {
              //             if (value) {
              //               context.bloc<SettingsBloc>()
              //                 ..add(DarkModeEnabled());
              //             } else {
              //               context.bloc<SettingsBloc>()
              //                 ..add(LightThemePressed());
              //             }
              //           },
              //           value: isDarkMode);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTopOverlay(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: (isShown) ? 1 : 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          height: kToolbarHeight,
          child: Stack(
            children: <Widget>[
              Center(
                child: Text(
                  "$bookTitle $chapterNumber",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(60),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => ExtendedNavigator.of(context)
                      .popUntil(ModalRoute.withName(Routes.bibleBookPageRoute)),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () => _showSettingsDialog(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
