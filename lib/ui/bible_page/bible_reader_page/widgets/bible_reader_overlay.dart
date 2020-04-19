import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildTopOverlay(context),
        _buildBottomOverlay(context),
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
                  onPressed: () => ExtendedNavigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
