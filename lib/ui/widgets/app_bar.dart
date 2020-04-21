import 'package:ccfii_read_obey_succeed/core/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/ccfii_logo.png'),
      ),
      centerTitle: true,
      title: BlocBuilder<BottomNavigationBloc, int>(
          builder: (context, currentIndex) {
        switch (currentIndex) {
          case 0:
            return Text(
              'HOME',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(60),
                  ),
            );
            break;
          case 1:
            return Text(
              'BIBLE',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(60),
                  ),
            );
            break;
          case 2:
            return Text(
              'Read Obey and Succeed'.toUpperCase(),
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(60),
                  ),
            );
            break;
          case 3:
            return Text(
              'My Profile'.toUpperCase(),
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(60),
                  ),
            );
            break;
        }
        return Container();
      }),
    );
  }
}
