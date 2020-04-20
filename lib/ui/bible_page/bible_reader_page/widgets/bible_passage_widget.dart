import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/passage/passage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../../core/colors.dart';
import '../../../../data/model/bible_chapter_content.dart';

class BiblePassageWidget extends StatelessWidget {
  final BibleChapterContent content;
  final bool isFirstVerse;
  const BiblePassageWidget({
    Key key,
    @required this.content,
    @required this.isFirstVerse,
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
    return BlocBuilder<PassageBloc, PassageState>(
      builder: (context, state) {
        bool isHighlighted = false;
        if (state is PassageShowHighlight) {
          for (final verse in state.highlightedVerses) {
            for (final highlightedContent in verse.chapterContents) {
              if (highlightedContent.verse == content.verse &&
                  highlightedContent.chapterNumber == content.chapterNumber) {
                isHighlighted = true;
              }
            }
          }
        }
        if (content.text.contains('[pas_title]')) {
          return _buildPassageWithTitleInline(context, isHighlighted);
        } else {
          return _buildDefaultPassage(context, isHighlighted);
        }
      },
    );
  }

  String _convertVerseNumberToSuperScript() {
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

  void _highlightVerse(BuildContext context) {
    context.bloc<PassageBloc>()
      ..add(PassageHighlighted(contentHighlighted: content));
  }

  void _removeHighlight(BuildContext context) {
    context.bloc<PassageBloc>()
      ..add(PassageHighlightRemoved(contentHighlighted: content));
  }

  Widget _buildDefaultPassage(BuildContext context, bool isHighlighted) {
    return SelectableText.rich(
        TextSpan(
            text: (isFirstVerse) ? '1' : _convertVerseNumberToSuperScript(),
            children: [
              TextSpan(
                text: ' ${content.text}',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: ScreenUtil().setSp(50),
                      fontFamily: 'Times New Roman',
                      decoration: (isHighlighted)
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      backgroundColor:
                          (isHighlighted) ? Colors.yellow : Colors.transparent,
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
        showCursor: false, onTap: () {
      if (!isHighlighted) {
        _highlightVerse(context);
      } else {
        _removeHighlight(context);
      }
    });
  }

  Widget _buildPassageWithTitleInline(
      BuildContext context, bool isHighlighted) {
    return SelectableText.rich(
      TextSpan(
          text: content.passageTitle + '\n',
          children: [
            TextSpan(
              text: (isFirstVerse)
                  ? content.verse.toString()
                  : _convertVerseNumberToSuperScript(),
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
                    fontFamily: 'Times New Roman',
                  ),
            ),
          ],
          style: Theme.of(context).textTheme.headline5),
      textAlign: TextAlign.justify,
      onTap: () {
        if (!isHighlighted) {
          _highlightVerse(context);
        } else {
          _removeHighlight(context);
        }
      },
    );
  }
}
