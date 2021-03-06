import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_sheet_color_picker.dart';

class BibleReaderBottomSheet extends StatefulWidget {
  final Color currentHighlightColor;
  const BibleReaderBottomSheet({
    Key key,
    @required this.currentHighlightColor,
  }) : super(key: key);

  @override
  _BibleReaderBottomSheetState createState() => _BibleReaderBottomSheetState();
}

class _BibleReaderBottomSheetState extends State<BibleReaderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().uiHeightPx * 0.08,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 5,
            width: 40,
          ),
          BottomSheetColorPicker(
            currentColor: widget.currentHighlightColor,
          ),
        ],
      ),
    );
  }
}
