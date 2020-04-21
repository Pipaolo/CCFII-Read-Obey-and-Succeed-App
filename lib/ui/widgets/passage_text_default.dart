import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/core/converters.dart';
import 'package:ccfii_read_obey_succeed/data/model/bible_chapter_content.dart';

class PassageTextDefault extends StatelessWidget {
  final Color highlightColor;
  final BibleChapterContent content;
  final bool isFirstVerse;
  final bool isHighlighted;
  final Function highlightedPressed;
  final Function removeHighlightPressed;
  final FocusNode focusNode;
  const PassageTextDefault({
    Key key,
    @required this.highlightColor,
    @required this.content,
    @required this.isFirstVerse,
    @required this.isHighlighted,
    @required this.highlightedPressed,
    @required this.removeHighlightPressed,
    @required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
          text: (isFirstVerse)
              ? '1'
              : convertVerseNumberToSuperScript(content.verse),
          children: [
            TextSpan(
              text: ' ${content.text}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: ScreenUtil().setSp(50),
                    fontFamily: 'Times New Roman',
                    decoration: (isHighlighted)
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    backgroundColor: (isHighlighted)
                        ? (highlightColor != null)
                            ? highlightColor
                            : Colors.yellow
                        : Colors.transparent,
                  ),
            ),
          ],
          style: (isFirstVerse)
              ? Theme.of(context).textTheme.headline5.copyWith(
                    fontSize: ScreenUtil().setSp(80),
                    fontWeight: FontWeight.bold,
                    color: ccfiiRed,
                    fontFamily: 'Times New Roman',
                  )
              : Theme.of(context).textTheme.headline5.copyWith(
                    fontSize: ScreenUtil().setSp(80),
                    fontWeight: FontWeight.bold,
                    color: ccfiiRed,
                    fontFamily: 'Times New Roman',
                  )),
      textAlign: TextAlign.justify,
      showCursor: false,
      onTap: (isHighlighted) ? removeHighlightPressed : highlightedPressed,
      focusNode: focusNode,
    );
  }
}
