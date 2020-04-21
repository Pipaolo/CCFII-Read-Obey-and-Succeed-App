import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_reader_bottom_sheet/bible_reader_bottom_sheet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BottomSheetColorPicker extends StatelessWidget {
  const BottomSheetColorPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().uiHeightPx * 0.035,
      child: BlockPicker(
        onColorChanged: (color) =>
            BlocProvider.of<BibleReaderBottomSheetBloc>(context)
              ..add(
                PassageHighlightColorChanged(color: color),
              ),
        itemBuilder: (color, isSelected, changeColor) {
          return Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.8),
                  offset: Offset(1.0, 2.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: changeColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 210),
                    opacity: isSelected ? 1.0 : 0.0,
                    child: Icon(
                      Icons.done,
                      color: useWhiteForeground(color)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        layoutBuilder: (context, colors, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final color = colors[i];
              return child(color);
            },
          );
        },
        pickerColor: Colors.amber,
      ),
    );
  }
}
