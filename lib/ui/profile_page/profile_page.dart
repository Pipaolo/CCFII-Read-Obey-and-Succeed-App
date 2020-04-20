import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/routes/router.gr.dart';
import 'package:ccfii_read_obey_succeed/ui/profile_page/widgets/profile_button.dart';
import 'package:ccfii_read_obey_succeed/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final OverlayEntry highlightsPage = OverlayEntry(
    builder: (context) => Positioned.fill(
      child: Container(
        color: Colors.white,
      ),
    ),
  );

  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 120, 40, 40),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ccfiiRed.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ProfileButton(
                      function: () => ExtendedNavigator.of(context)
                          .pushNamed(Routes.highlightsPageRoute),
                      title: 'Highlights',
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(child: CustomAppBar(), height: kToolbarHeight),
          ),
        ],
      ),
    );
  }
}
