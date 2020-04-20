// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ccfii_read_obey_succeed/ui/splash_page/splash_page.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_book_page/bible_book_page.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bible_reader_page.dart';
import 'package:ccfii_read_obey_succeed/data/model/bible_chapter.dart';
import 'package:ccfii_read_obey_succeed/ui/profile_page/highlights_page/highlights_page.dart';
import 'package:ccfii_read_obey_succeed/ui/bottom_navigation_controller.dart';

abstract class Routes {
  static const splashPageRoute = '/';
  static const bibleBookPageRoute = '/bible-book-page-route';
  static const bibleReaderPageRoute = '/bible-reader-page-route';
  static const highlightsPageRoute = '/highlights-page-route';
  static const bottomNavigationControllerRoute =
      '/bottom-navigation-controller-route';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SplashPage(),
          settings: settings,
        );
      case Routes.bibleBookPageRoute:
        if (hasInvalidArgs<BibleBookPageArguments>(args)) {
          return misTypedArgsRoute<BibleBookPageArguments>(args);
        }
        final typedArgs =
            args as BibleBookPageArguments ?? BibleBookPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              BibleBookPage(key: typedArgs.key, bookId: typedArgs.bookId)
                  .wrappedRoute,
          settings: settings,
        );
      case Routes.bibleReaderPageRoute:
        if (hasInvalidArgs<BibleReaderPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<BibleReaderPageArguments>(args);
        }
        final typedArgs = args as BibleReaderPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => BibleReaderPage(
                  key: typedArgs.key,
                  chapter: typedArgs.chapter,
                  bookTitle: typedArgs.bookTitle)
              .wrappedRoute,
          settings: settings,
        );
      case Routes.highlightsPageRoute:
        if (hasInvalidArgs<HighlightsPageArguments>(args)) {
          return misTypedArgsRoute<HighlightsPageArguments>(args);
        }
        final typedArgs =
            args as HighlightsPageArguments ?? HighlightsPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => HighlightsPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.bottomNavigationControllerRoute:
        if (hasInvalidArgs<BottomNavigationControllerArguments>(args)) {
          return misTypedArgsRoute<BottomNavigationControllerArguments>(args);
        }
        final typedArgs = args as BottomNavigationControllerArguments ??
            BottomNavigationControllerArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              BottomNavigationController(key: typedArgs.key).wrappedRoute,
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//BibleBookPage arguments holder class
class BibleBookPageArguments {
  final Key key;
  final String bookId;
  BibleBookPageArguments({this.key, this.bookId});
}

//BibleReaderPage arguments holder class
class BibleReaderPageArguments {
  final Key key;
  final BibleChapter chapter;
  final String bookTitle;
  BibleReaderPageArguments(
      {this.key, @required this.chapter, @required this.bookTitle});
}

//HighlightsPage arguments holder class
class HighlightsPageArguments {
  final Key key;
  HighlightsPageArguments({this.key});
}

//BottomNavigationController arguments holder class
class BottomNavigationControllerArguments {
  final Key key;
  BottomNavigationControllerArguments({this.key});
}
