import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/passage/passage_bloc.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bloc/bible_page/bible_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HighlightsPage extends StatelessWidget {
  const HighlightsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Highlights',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: ScreenUtil().setSp(120),
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
            BlocBuilder<PassageBloc, PassageState>(
              builder: (context, state) {
                if (state is PassageShowHighlight) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, i) {
                      final verse = state.highlightedVerses[i];
                      final bookTitle = context
                          .bloc<BiblePageBloc>()
                          .bibleDirectories
                          .firstWhere((element) => element.id
                              .contains(verse.chapterContents.first.bookId))
                          .title;
                      final bookChapter =
                          verse.chapterContents.first.chapterNumber;
                      final verseRange =
                          '${verse.chapterContents.first.verse}:${verse.chapterContents.last.verse}';
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('$bookTitle $bookChapter $verseRange',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontSize: ScreenUtil().setSp(60),
                                      )),
                              Divider(
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text('$bookTitle $bookChapter $verseRange',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        ),
                      );
                    }, childCount: state.highlightedVerses.length),
                  );
                } else if (state is PassageHighlightEmpty) {
                  return SliverFillRemaining(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text('No Highlights Found!'),
                  ));
                }
                return SliverToBoxAdapter(child: Container());
              },
            )
          ],
        ),
      ),
    );
  }
}
