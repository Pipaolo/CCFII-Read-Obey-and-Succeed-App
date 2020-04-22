import 'package:ccfii_read_obey_succeed/data/model/highlighted_content.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_highlighted_verse/bible_highlighted_verse_bloc.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bloc/bible_passage/bible_passage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/bible_chapter_content.dart';
import '../../../widgets/passage_text_default.dart';
import '../../../widgets/passage_text_with_title.dart';
import '../bloc/bible_reader_bottom_sheet/bible_reader_bottom_sheet_bloc.dart';

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
  HighlightedContent highlightedGroup;
  Color highlightColor;

  _onFocusChanged() {
    if (focusNode.hasFocus) {
      if (isHighlighted) {
        context.bloc<BibleReaderBottomSheetBloc>()..add(PassageSheetClosed());
        context.bloc<BibleReaderBottomSheetBloc>()
          ..add(PassageSheetShowed(
              verse: widget.content, highlightedGroup: highlightedGroup));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BibleHighlightedVerseBloc>(
      create: (context) => BibleHighlightedVerseBloc(
        biblePassageBloc: context.bloc<BiblePassageBloc>(),
      )..add(BibleHighlightedVerseChecked(verse: widget.content)),
      child: BlocBuilder<BibleHighlightedVerseBloc, BibleHighlightedVerseState>(
        builder: (context, state) {
          if (state is BibleVerseHighlighted) {
            Future.delayed(
                Duration.zero,
                () => setState(() {
                      isHighlighted = true;
                      highlightedGroup = state.highlightedContent;
                      highlightColor = state.highlightColor;
                    }));
          } else if (state is BibleVerseNotHighlighted) {
            Future.delayed(
                Duration.zero,
                () => setState(() {
                      isHighlighted = false;
                    }));
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
      ),
    );
  }

  void _highlightVerse(BuildContext context) {
    context.bloc<BiblePassageBloc>()
      ..add(BiblePassageHighlighted(contentHighlighted: widget.content));
    context.bloc<BibleReaderBottomSheetBloc>()
      ..add(PassageSheetShowed(verse: widget.content));
  }

  void _removeHighlight(BuildContext context) {
    setState(() => isHighlighted = false);
    context.bloc<BiblePassageBloc>()
      ..add(BiblePassageHighlightRemoved(contentHighlighted: widget.content));
    context.bloc<BibleReaderBottomSheetBloc>()..add(PassageSheetClosed());
  }
}
