import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/highlighted_content.dart';
import 'highlights_card_header.dart';
import 'highlights_passage.dart';

class HighlightsCard extends StatefulWidget {
  final HighlightedContent content;
  HighlightsCard({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  _HighlightsCardState createState() => _HighlightsCardState();
}

class _HighlightsCardState extends State<HighlightsCard> {
  final ExpandableController controller = ExpandableController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            controller.toggle();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IgnorePointer(
              child: ExpandablePanel(
                controller: controller,
                theme: ExpandableThemeData(hasIcon: false, useInkWell: false),
                header: HighlightsCardHeader(
                  content: widget.content,
                ),
                collapsed: HighlightsPassage(
                    content: widget.content.chapterContents.first),
                expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.content.chapterContents
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: HighlightsPassage(
                                content: e,
                              ),
                            ))
                        .toList()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
