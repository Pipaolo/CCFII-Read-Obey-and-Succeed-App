import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_passage/bible_passage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'widgets/highlights_card.dart';

class HighlightsPage extends StatelessWidget {
  const HighlightsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => ExtendedNavigator.of(context).pop(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            BlocBuilder<BiblePassageBloc, BiblePassageState>(
              builder: (context, state) {
                if (state is BiblePassageShowHighlight) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final content = state.highlightedVerses[i];
                        return HighlightsCard(
                          content: content,
                        );
                      },
                      childCount: state.highlightedVerses.length,
                    ),
                  );
                } else if (state is BiblePassageHighlightEmpty) {
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
