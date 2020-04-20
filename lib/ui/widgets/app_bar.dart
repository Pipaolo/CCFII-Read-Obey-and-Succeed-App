import 'package:ccfii_read_obey_succeed/core/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key key}) : super(key: key);

  final TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

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
            return Text('HOME', style: textStyle);
            break;
          case 1:
            return Text('BIBLE', style: textStyle);
            break;
          case 2:
            return Text('Read Obey and Succeed'.toUpperCase(),
                style: textStyle);
            break;
          case 3:
            return Text('My Profile'.toUpperCase(), style: textStyle);
            break;
        }
        return Container();
      }),
    );
  }
}
