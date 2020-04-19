import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../../core/styling.dart';
import '../../../../data/model/bible_chapter_content.dart';

class BiblePassageWidget extends StatelessWidget {
  final BibleChapterContent content;
  const BiblePassageWidget({
    Key key,
    this.content,
  }) : super(key: key);

  static const Map<String, int> superScriptCharCodes = {
    '0': 0x2070,
    '1': 0x00B9,
    '2': 0x00B2,
    '3': 0x00B3,
    '4': 0x2074,
    '5': 0x2075,
    '6': 0x2076,
    '7': 0x2077,
    '8': 0x2078,
    '9': 0x2079,
  };

  @override
  Widget build(BuildContext context) {
    if (content.text.contains('[pas_title]')) {
      return Text.rich(
        TextSpan(
          text: content.passageTitle + '\n',
          children: [
            TextSpan(
              text: (content.verse == 1)
                  ? content.verse.toString()
                  : convertVerseNumberToSuperScript(),
              style: (content.verse == 1) ? firstVerseStyle : commonVerseStyle,
            ),
            TextSpan(
              text: content.text.replaceAll('[pas_title]', ''),
              style: commonPassageStyle,
            ),
          ],
          style: TextStyle(
            fontSize: ScreenUtil().setSp(50),
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Text.rich(
        TextSpan(
          text: (content.verse == 1)
              ? content.verse.toString()
              : convertVerseNumberToSuperScript(),
          children: [
            TextSpan(
              text: content.text,
              style: commonPassageStyle,
            ),
          ],
          style: (content.verse == 1) ? firstVerseStyle : commonVerseStyle,
        ),
      );
    }
  }

  String convertVerseNumberToSuperScript() {
    //Convert the verse number to strings
    //After converting then turn it into a list
    final verseString = content.verse.toString();
    final verseSplitted = verseString.split('');
    final convertedVerseString = verseSplitted
        .map((e) => String.fromCharCode(superScriptCharCodes[e]))
        .toList()
        .join();
    return '$convertedVerseString ';
  }
}
