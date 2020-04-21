import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../data/model/bible_chapter.dart';
import '../../../routes/router.gr.dart';
import 'bloc/bible_reader_overlay/bible_reader_overlay_bloc.dart';
import 'bloc/passage/passage_bloc.dart';
import 'widgets/bible_passage_widget.dart';
import 'widgets/bible_reader_overlay.dart';

class BibleReaderPage extends StatefulWidget implements AutoRouteWrapper {
  final BibleChapter chapter;
  final String bookTitle;
  final String bookId;

  BibleReaderPage({
    Key key,
    @required this.chapter,
    @required this.bookTitle,
    @required this.bookId,
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
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();

  final Flushbar highlightAddedFlushbar = Flushbar(
    message: 'Highlight Added',
    margin: const EdgeInsets.all(10),
    duration: Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: 10,
    mainButton: FlatButton(
      child: Text('See Highlights', style: TextStyle(color: ccfiiLightOrange)),
      onPressed: () {
        ExtendedNavigator.rootNavigator.pushNamed(Routes.highlightsPageRoute);
      },
    ),
  );

  final Flushbar highlightRemovedFlushbar = Flushbar(
    message: 'Highlight Removed',
    margin: const EdgeInsets.all(10),
    duration: Duration(seconds: 2),
    borderRadius: 10,
    flushbarPosition: FlushbarPosition.TOP,
    mainButton: FlatButton(
      child: Text('See Highlights', style: TextStyle(color: ccfiiLightOrange)),
      onPressed: () {
        ExtendedNavigator.rootNavigator.pushNamed(Routes.highlightsPageRoute);
      },
    ),
  );

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
    return BlocListener<PassageBloc, PassageState>(
      listener: (context, state) {
        if (state is PassageShowHighlight) {
          if (state.isAdded != null) {
            if (state.isAdded) {
              highlightRemovedFlushbar..dismiss();
              highlightAddedFlushbar
                ..dismiss()
                ..show(context);
            } else {
              highlightAddedFlushbar..dismiss();
              highlightRemovedFlushbar
                ..dismiss()
                ..show(context);
            }
          }
        } else if (state is PassageHighlightEmpty) {
          highlightAddedFlushbar..dismiss();
          highlightRemovedFlushbar
            ..dismiss()
            ..show(context);
        }
      },
      child: SafeArea(
        child: Scaffold(
          key: _key,
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
      ),
    );
  }

  _buildChapterContent() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.chapter.content.map((e) {
          final bool isFirstVerse =
              (widget.chapter.content.indexOf(e) == 0) ? true : false;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: BiblePassageWidget(
              content: e.copyWith(
                verse: (isFirstVerse) ? 1 : e.verse,
              ),
              bookId: widget.bookId,
              isFirstVerse: isFirstVerse,
            ),
          );
        }).toList());
  }
}
