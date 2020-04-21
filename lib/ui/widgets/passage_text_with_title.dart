import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../core/colors.dart';
import '../../core/converters.dart';
import '../../data/model/bible_chapter_content.dart';

class PassageTextWithTitle extends StatelessWidget {
  final Color highlightColor;
  final BibleChapterContent content;
  final bool isFirstVerse;
  final bool isHighlighted;
  final Function highlightedPressed;
  final Function removeHighlightPressed;
  final FocusNode focusNode;
  const PassageTextWithTitle({
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
          text: content.passageTitle + '\n',
          children: [
            TextSpan(
              text: (isFirstVerse)
                  ? content.verse.toString()
                  : convertVerseNumberToSuperScript(content.verse),
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
                      ),
            ),
            TextSpan(
              text: content.text.replaceAll('[pas_title]', ''),
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
          style: Theme.of(context).textTheme.headline5),
      textAlign: TextAlign.justify,
      onTap: (isHighlighted) ? removeHighlightPressed : highlightedPressed,
      focusNode: focusNode,
    );
  }
}
