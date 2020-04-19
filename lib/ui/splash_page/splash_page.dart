import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    Future.delayed(
        Duration(seconds: 2),
        () => ExtendedNavigator.of(context)
            .pushReplacementNamed(Routes.bottomNavigationControllerRoute));
    return Scaffold(
      body: Center(
        child: Text('Read Obey Succeed'),
      ),
    );
  }
}
