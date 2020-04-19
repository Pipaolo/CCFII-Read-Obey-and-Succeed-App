import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'colors.dart';

final TextStyle firstVerseStyle = TextStyle(
  color: ccfiiRed,
  fontWeight: FontWeight.bold,
  fontSize: ScreenUtil().setSp(100),
);
final TextStyle commonVerseStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: ScreenUtil().setSp(80),
);
final TextStyle commonPassageStyle = TextStyle(
  fontSize: ScreenUtil().setSp(70),
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
