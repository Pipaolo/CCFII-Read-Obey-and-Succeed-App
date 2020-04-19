import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:ccfii_read_obey_succeed/core/colors.dart';

class BibleCategoryTitle extends StatelessWidget {
  final String title;
  final bool isLeft;

  const BibleCategoryTitle({
    Key key,
    @required this.title,
    @required this.isLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ccfiiRed,
        borderRadius: (isLeft)
            ? BorderRadius.only(
                topRight: Radius.circular(80),
                bottomRight: Radius.circular(80),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(100),
        vertical: ScreenUtil().setHeight(40),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(60),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
