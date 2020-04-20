import 'package:ccfii_read_obey_succeed/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          child: CustomAppBar(),
        ),
        Container(
          child: Text('Home Page'),
        ),
      ],
    );
  }
}
