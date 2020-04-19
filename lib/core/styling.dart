import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final TextStyle firstVerseStyle = GoogleFonts.merriweather(
  color: ccfiiRed,
  fontWeight: FontWeight.bold,
  fontSize: ScreenUtil().setSp(100),
);
final TextStyle commonVerseStyle = GoogleFonts.merriweather(
  fontWeight: FontWeight.bold,
  fontSize: ScreenUtil().setSp(80),
);
final TextStyle commonPassageStyle = GoogleFonts.merriweather(
  fontSize: ScreenUtil().setSp(70),
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
