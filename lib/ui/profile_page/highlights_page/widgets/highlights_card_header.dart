import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../../core/colors.dart';
import '../../../../data/model/highlighted_content.dart';
import '../../../bible_page/bloc/bible_page/bible_page_bloc.dart';

class HighlightsCardHeader extends StatelessWidget {
  final HighlightedContent content;
  const HighlightsCardHeader({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookTitle = context
        .bloc<BiblePageBloc>()
        .bibleDirectories
        .firstWhere((element) =>
            element.id.contains(content.chapterContents.first.bookId))
        .title;
    final bookChapter = content.chapterContents.first.chapterNumber;
    String verseRange = '';
    if (content.chapterContents.length > 1) {
      verseRange =
          '${content.chapterContents.first.verse}-${content.chapterContents.last.verse}';
    } else {
      verseRange = content.chapterContents.first.verse.toString();
    }

    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$bookTitle $bookChapter:$verseRange',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontSize: ScreenUtil().setSp(60),
                    )),
            Divider(
              thickness: 2,
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: (content.highlightColor != null)
                  ? Color.fromRGBO(content.highlightColor[0],
                      content.highlightColor[1], content.highlightColor[2], 1)
                  : ccfiiLightOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 5,
            width: 30,
          ),
        ),
      ],
    );
  }
}
