import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:ccfii_read_obey_succeed/core/colors.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final Function function;

  const ProfileButton({
    Key key,
    @required this.title,
    @required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        color: ccfiiLightOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: function,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: ScreenUtil().setSp(60),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
