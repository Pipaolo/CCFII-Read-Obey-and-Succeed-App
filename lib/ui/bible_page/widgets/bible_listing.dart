import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/core/colors.dart';
import 'package:ccfii_read_obey_succeed/routes/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:ccfii_read_obey_succeed/data/model/bible_directory.dart';

import 'bible_category_title.dart';

class BibleListing extends StatelessWidget {
  final String title;
  final bool isLeft;
  final List<BibleDirectory> directories;
  const BibleListing({
    Key key,
    @required this.title,
    @required this.directories,
    @required this.isLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: (isLeft)
              ? const EdgeInsets.fromLTRB(0, 30, 20, 0)
              : const EdgeInsets.fromLTRB(20, 30, 0, 0),
          child: Material(
            color: ccfiiLightOrange,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: directories.length,
                itemBuilder: (context, index) {
                  final bibleDirectory = directories[index];
                  return ListTile(
                    title: Text(bibleDirectory.title),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () => ExtendedNavigator.of(context).pushNamed(
                      Routes.bibleBookPageRoute,
                      arguments: BibleBookPageArguments(
                        bookId: bibleDirectory.id,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: (isLeft) ? Alignment.topLeft : Alignment.topRight,
          child: BibleCategoryTitle(
            title: title,
            isLeft: isLeft,
          ),
        )
      ],
    );
  }
}
