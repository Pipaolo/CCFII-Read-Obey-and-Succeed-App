import 'package:ccfii_read_obey_succeed/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class RosPage extends StatelessWidget {
  const RosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: CustomAppBar(),
        ),
        Center(
          child: Container(
            child: Text("Ros Page"),
          ),
        ),
      ],
    );
  }
}
