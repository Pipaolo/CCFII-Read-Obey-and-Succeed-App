import 'package:ccfii_read_obey_succeed/data/model/bible_chapter_content.dart';
import 'package:ccfii_read_obey_succeed/data/model/highlighted_content.dart';
import 'package:hive/hive.dart';
import 'package:dartx/dartx.dart';

class HiveRepository {
  Future<void> changeThemeMode(String mode) async {
    try {
      final box = await Hive.openBox('themeMode');
      await box.put('theme', mode);
    } catch (e) {
      print('ChangeThemeMode: $e');
    }
  }

  Future<bool> checkForExisitingVerse(
      List<dynamic> currentValue, BibleChapterContent verse) async {
    //Iterate to all the values in the database
    bool hasMatch = false;

    for (final value in currentValue) {
      final List<BibleChapterContent> verses =
          (value['verseHighlighted'] as List<dynamic>)
              .map((verse) => BibleChapterContent(
                  bookId: verse['bookId'],
                  chapterNumber: verse['chapterNumber'],
                  passageTitle: verse['passageTitle'],
                  text: verse['text'],
                  verse: verse['verse']))
              .toList();
      if (verses.contains(verse)) {
        hasMatch = true;

        break;
      }
    }
    return hasMatch;
  }

  Future<Map<String, int>> getMatchedHighlightedVersePosition(
      List<dynamic> currentValue, BibleChapterContent verse) async {
    int highlightedVerseIndex = 0;
    int highlightedContentIndex = 0;
    for (final value in currentValue) {
      final List<BibleChapterContent> verses =
          (value['verseHighlighted'] as List<dynamic>)
              .map((verse) => BibleChapterContent(
                  bookId: verse['bookId'],
                  chapterNumber: verse['chapterNumber'],
                  passageTitle: verse['passageTitle'],
                  text: verse['text'],
                  verse: verse['verse']))
              .toList();
      if (verses.contains(verse)) {
        highlightedVerseIndex = verses.indexOf(verse);
        highlightedContentIndex++;
        break;
      }
    }
    return {
      'highlightedVerseIndex': highlightedVerseIndex,
      'highlightedContentIndex': highlightedContentIndex,
    };
  }

  Future<List<int>> checkNeighborsToMerge(
      List<dynamic> currentValue, BibleChapterContent highlightedVerse) async {
    List<int> neighborLocations = [];
    int index = 0;
    for (final value in currentValue) {
      final List<BibleChapterContent> verses =
          (value['verseHighlighted'] as List<dynamic>)
              .map((content) => BibleChapterContent(
                  bookId: content['bookId'],
                  chapterNumber: content['chapterNumber'],
                  passageTitle: content['passageTitle'],
                  text: content['text'],
                  verse: content['verse']))
              .toList();
      for (final verse in verses) {
        final diff = (verse.verse - highlightedVerse.verse).abs();
        if (diff == 1) {
          neighborLocations.add(index);
        }
      }
      index++;
    }
    return neighborLocations;
  }

  Future<void> addHighlightedVerses(
      BibleChapterContent highlightedVerse) async {
    print('You have pressed the verse: ${highlightedVerse.verse}');

    final Box highlightedVerseBox = await Hive.openBox('highlightedVerses');
    final List<dynamic> currentValue =
        highlightedVerseBox.get(highlightedVerse.bookId, defaultValue: []);

    if (currentValue.isEmpty) {
      currentValue.add({
        'verseHighlighted': [highlightedVerse.toJson()],
        'highlightColor': [255, 212, 146],
      });
      highlightedVerseBox.put(highlightedVerse.bookId, currentValue);
    } else {
      //Check if there are available verses to be merged
      final highlightedVersesToMergePositions =
          await checkNeighborsToMerge(currentValue, highlightedVerse);

      if (highlightedVersesToMergePositions.length > 0) {
        final firstHighlightedContentRaw =
            currentValue[highlightedVersesToMergePositions.first];
        final List<dynamic> verseContents =
            firstHighlightedContentRaw['verseHighlighted'];

        //After fetching the first value in the list then proceed in adding the verse to the
        // current verse
        verseContents.add(highlightedVerse.toJson());

        if (highlightedVersesToMergePositions.length != 1) {
          for (int pos in highlightedVersesToMergePositions.getRange(
              1, highlightedVersesToMergePositions.length)) {
            final highlightedContentRaw = currentValue[pos];
            verseContents.addAll(highlightedContentRaw['verseHighlighted']);
            currentValue.removeAt(pos);
          }
        }

        currentValue[highlightedVersesToMergePositions.first] = {
          'verseHighlighted': verseContents,
          'hightlightColor': firstHighlightedContentRaw['highlightColor'],
        };
        highlightedVerseBox.put(highlightedVerse.bookId, currentValue);
      }

      final hasMatch =
          await checkForExisitingVerse(currentValue, highlightedVerse);
      if (!hasMatch) {
        final updatedValue = currentValue.toList();
        updatedValue.add({
          'verseHighlighted': [highlightedVerse.toJson()],
          'highlightColor': [255, 212, 146],
        });
        highlightedVerseBox.put(highlightedVerse.bookId, updatedValue);
      }
    }
    // await highlightedVerseBox.clear();
  }

  /*
    In Removing we have 3 cases
    1: When a user deletes a single verse without a group
    2: When a user deleles a verse inside group the group should be seperated

  */
  Future<void> removeHighlightedVerse(
      BibleChapterContent highlightedVerse) async {
    final Box highlightedVerseBox = await Hive.openBox('highlightedVerses');
    final List<dynamic> currentValue =
        highlightedVerseBox.get(highlightedVerse.bookId, defaultValue: []);
    final hasMatch =
        await checkForExisitingVerse(currentValue, highlightedVerse);
    if (hasMatch) {
      final highlightedContentPos = await getMatchedHighlightedVersePosition(
          currentValue, highlightedVerse);
      final itemPos = highlightedContentPos['highlightedVerseIndex'];
      final contentPos = highlightedContentPos['highlightedContentIndex'];
      final highlightedContentRaw = currentValue[contentPos - 1];
      final List<dynamic> highlightedVerses =
          highlightedContentRaw['verseHighlighted'];
      final seperatedVersesFront =
          highlightedVerses.sublist(itemPos + 1).toList();
      final diff = highlightedVerses.length - seperatedVersesFront.length;
      final seperatedVersesBack =
          highlightedVerses.sublist(0, diff - 1).toList();
      final updatedValue = currentValue.toList();

      if (seperatedVersesFront.length == 0) {
        if (seperatedVersesBack.isNotEmpty) {
          updatedValue.add({
            'verseHighlighted': seperatedVersesBack,
            'highlightColor': highlightedContentRaw['highlightColor'],
          });
        }

        if (updatedValue.length == 1) {
          updatedValue.removeAt(contentPos - 1);
        } else {
          updatedValue.removeAt(contentPos);
        }

        highlightedVerseBox.put(highlightedVerse.bookId, updatedValue);
      } else if (seperatedVersesFront.length == highlightedVerses.length - 1) {
        updatedValue.add({
          'verseHighlighted': seperatedVersesFront,
          'highlightColor': highlightedContentRaw['highlightColor'],
        });
        updatedValue.removeAt(contentPos - 1);
        highlightedVerseBox.put(highlightedVerse.bookId, updatedValue);
      } else {
        updatedValue.add({
          'verseHighlighted': seperatedVersesFront,
          'highlightColor': highlightedContentRaw['highlightColor'],
        });
        updatedValue.add({
          'verseHighlighted': seperatedVersesBack,
          'highlightColor': highlightedContentRaw['highlightColor'],
        });
        updatedValue.removeAt(contentPos - 1);
        highlightedVerseBox.put(highlightedVerse.bookId, updatedValue);
      }
    }
  }

  Future<List<HighlightedContent>> fetchHighlightedVerses() async {
    final Box highlightedVerseBox = await Hive.openBox('highlightedVerses');
    final highlightedVersesGroupedByBook = highlightedVerseBox.values.toList();
    final List<HighlightedContent> highlightedVerses = [];

    for (final versesInBook in highlightedVersesGroupedByBook) {
      for (final highlightedContent in versesInBook) {
        highlightedVerses.add(
          HighlightedContent(
            chapterContents: List<BibleChapterContent>.from(
              highlightedContent['verseHighlighted'].map(
                (e) => BibleChapterContent(
                  bookId: e['bookId'],
                  chapterNumber: e['chapterNumber'],
                  passageTitle: e['passageTitle'],
                  text: e['text'],
                  verse: e['verse'],
                ),
              ),
            ).sortedBy((element) => element.verse),
            highlightColor: highlightedContent['highlightColor'],
          ),
        );
      }
    }
    return highlightedVerses;
  }
}
