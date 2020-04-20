import 'package:auto_route/auto_route_annotations.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_book_page/bible_book_page.dart';
import 'package:ccfii_read_obey_succeed/ui/bible_page/bible_reader_page/bible_reader_page.dart';
import 'package:ccfii_read_obey_succeed/ui/bottom_navigation_controller.dart';
import 'package:ccfii_read_obey_succeed/ui/profile_page/highlights_page/highlights_page.dart';
import 'package:ccfii_read_obey_succeed/ui/splash_page/splash_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  SplashPage splashPageRoute;

  BibleBookPage bibleBookPageRoute;
  BibleReaderPage bibleReaderPageRoute;

  HighlightsPage highlightsPageRoute;

  BottomNavigationController bottomNavigationControllerRoute;
}
