import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ccfii_read_obey_succeed/core/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, currentIndex) {
        return BottomNavyBar(
          onItemSelected: (index) => context.bloc<BottomNavigationBloc>().add(
                BottomNavigationItemPressed(index: index),
              ),
          selectedIndex: currentIndex,
          curve: Curves.ease,
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              textAlign: TextAlign.center,
              activeColor: ccfiiRed,
              inactiveColor: Colors.grey.shade500,
            ),
            BottomNavyBarItem(
              icon: Icon(MaterialCommunityIcons.bible),
              title: Text('Bible'),
              activeColor: ccfiiRed,
              textAlign: TextAlign.center,
              inactiveColor: Colors.grey.shade500,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('R.O.S'),
              textAlign: TextAlign.center,
              activeColor: ccfiiRed,
              inactiveColor: Colors.grey.shade500,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('My Profile'),
              textAlign: TextAlign.center,
              activeColor: ccfiiRed,
              inactiveColor: Colors.grey.shade500,
            ),
          ],
        );
      },
    );
  }
}
