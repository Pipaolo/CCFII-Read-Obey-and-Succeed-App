import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/core/converters.dart';
import 'package:flutter/material.dart';

import 'package:ccfii_read_obey_succeed/data/model/bible_chapter_content.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HighlightsPassage extends StatelessWidget {
  final BibleChapterContent content;
  const HighlightsPassage({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
          text: convertVerseNumberToSuperScript(content.verse),
          children: [
            TextSpan(
              text: '${content.text}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: ScreenUtil().setSp(40),
                    fontFamily: 'Times New Roman',
                  ),
            ),
          ],
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: ScreenUtil().setSp(80),
                fontWeight: FontWeight.bold,
                color: ccfiiRed,
                fontFamily: 'Times New Roman',
              )),
      textAlign: TextAlign.justify,
      showCursor: false,
    );
  }
}
