import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../data/model/bible_chapter.dart';
import 'bloc/bible_reader_overlay/bible_reader_overlay_bloc.dart';
import 'widgets/bible_passage_widget.dart';
import 'widgets/bible_reader_overlay.dart';

class BibleReaderPage extends StatefulWidget implements AutoRouteWrapper {
  final BibleChapter chapter;
  final String bookTitle;

  BibleReaderPage({
    Key key,
    @required this.chapter,
    @required this.bookTitle,
  }) : super(key: key);
  @override
  Widget get wrappedRoute => BlocProvider<BibleReaderOverlayBloc>(
        create: (context) => BibleReaderOverlayBloc(),
        child: this,
      );

  @override
  _BibleReaderPageState createState() => _BibleReaderPageState();
}

class _BibleReaderPageState extends State<BibleReaderPage> {
  final ScrollController scrollController = ScrollController();
  BibleReaderOverlayBloc overlayBloc;

  scrollListener() {
    final scrollDirection = scrollController.position.userScrollDirection;

    if (scrollDirection == ScrollDirection.forward) {
      overlayBloc.add(BibleReaderOverlayEvent.overlayShowed);
    } else if (scrollDirection == ScrollDirection.reverse) {
      overlayBloc.add(BibleReaderOverlayEvent.overlayHide);
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    overlayBloc = context.bloc<BibleReaderOverlayBloc>();
  }

  @override
  void dispose() {
    overlayBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    if (overlayBloc.state ==
                        BibleReaderOverlayState.overlayShown) {
                      overlayBloc.add(BibleReaderOverlayEvent.overlayHide);
                    } else {
                      overlayBloc.add(BibleReaderOverlayEvent.overlayShowed);
                    }
                  },
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: kToolbarHeight + 20,
                          ),
                          if ('${widget.bookTitle} ${widget.chapter.number}' !=
                              widget.chapter.title)
                            Text(
                              widget.chapter.title,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(60),
                                color: ccfiiRed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          _buildChapterContent(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<BibleReaderOverlayBloc, BibleReaderOverlayState>(
                builder: (context, state) {
                  return BibleReaderOverlay(
                    bookTitle: widget.bookTitle,
                    chapterNumber: widget.chapter.number.toString(),
                    isShown: (state == BibleReaderOverlayState.overlayShown)
                        ? true
                        : false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildChapterContent() {
    return Column(
        children: widget.chapter.content
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: BiblePassageWidget(
                    content: e,
                    isFirstVerse:
                        (widget.chapter.content.first.verse == e.verse)
                            ? true
                            : false,
                  ),
                ))
            .toList());
  }
}
