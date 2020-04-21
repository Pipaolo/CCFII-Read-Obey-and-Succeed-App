import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/bible_chapter_content.dart';
import '../../../widgets/passage_text_default.dart';
import '../../../widgets/passage_text_with_title.dart';
import '../bloc/bible_reader_bottom_sheet/bible_reader_bottom_sheet_bloc.dart';
import '../bloc/passage/passage_bloc.dart';

class BiblePassageWidget extends StatefulWidget {
  final BibleChapterContent content;
  final String bookId;
  final bool isFirstVerse;
  const BiblePassageWidget({
    Key key,
    @required this.content,
    @required this.isFirstVerse,
    @required this.bookId,
  }) : super(key: key);

  @override
  _BiblePassageWidgetState createState() => _BiblePassageWidgetState();
}

class _BiblePassageWidgetState extends State<BiblePassageWidget> {
  final focusNode = FocusNode();
  bool isHighlighted = false;

  _onFocusChanged() {
    if (isHighlighted) {
      context.bloc<BibleReaderBottomSheetBloc>()
        ..add(PassageSheetShowed(verse: widget.content));
    } else {
      context.bloc<BibleReaderBottomSheetBloc>()..add(PassageSheetClosed());
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassageBloc, PassageState>(
      builder: (context, state) {
        Color highlightColor;

        if (state is PassageShowHighlight) {
          for (final verse in state.highlightedVerses) {
            for (final highlightedContent in verse.chapterContents) {
              if (highlightedContent.verse == widget.content.verse &&
                  highlightedContent.chapterNumber ==
                      widget.content.chapterNumber &&
                  highlightedContent.bookId == widget.bookId) {
                Future.delayed(
                  Duration.zero,
                  () => setState(() => isHighlighted = true),
                );
                final highlightColorRGB = verse.highlightColor;
                if (highlightColorRGB != null) {
                  highlightColor = Color.fromRGBO(highlightColorRGB[0],
                      highlightColorRGB[1], highlightColorRGB[2], 1);
                }
              }
            }
          }
        }

        if (widget.content.text.contains('[pas_title]')) {
          return PassageTextWithTitle(
            content: widget.content,
            highlightedPressed: () => _highlightVerse(context),
            removeHighlightPressed: () => _removeHighlight(context),
            isFirstVerse: widget.isFirstVerse,
            isHighlighted: isHighlighted,
            highlightColor: highlightColor,
            focusNode: focusNode,
          );
        } else {
          return PassageTextDefault(
            content: widget.content,
            highlightedPressed: () => _highlightVerse(context),
            removeHighlightPressed: () => _removeHighlight(context),
            isFirstVerse: widget.isFirstVerse,
            isHighlighted: isHighlighted,
            highlightColor: highlightColor,
            focusNode: focusNode,
          );
        }
      },
    );
  }

  void _highlightVerse(BuildContext context) {
    context.bloc<PassageBloc>()
      ..add(PassageHighlighted(contentHighlighted: widget.content));
    context.bloc<BibleReaderBottomSheetBloc>()
      ..add(PassageSheetShowed(verse: widget.content));
  }

  void _removeHighlight(BuildContext context) {
    setState(() => isHighlighted = false);
    context.bloc<PassageBloc>()
      ..add(PassageHighlightRemoved(contentHighlighted: widget.content));

    context.bloc<BibleReaderBottomSheetBloc>()..add(PassageSheetClosed());
  }
}
