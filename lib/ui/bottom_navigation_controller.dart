import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'bible_page/bible_page.dart';
import 'home_page/home_page.dart';
import 'profile_page/profile_page.dart';
import 'ros_page/ros_page.dart';
import 'widgets/bottom_navigation_bar.dart';

class BottomNavigationController extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget get wrappedRoute => BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(),
        child: this,
      );

  BottomNavigationController({Key key}) : super(key: key);
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BottomNavigationBloc, int>(
        listener: (context, currentIndex) {
          pageController.jumpToPage(currentIndex);
        },
        child: PageView(
          children: <Widget>[
            HomePage(),
            BiblePage(),
            RosPage(),
            ProfilePage(),
          ],
          controller: pageController,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
