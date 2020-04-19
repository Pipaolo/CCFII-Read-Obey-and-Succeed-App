import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_directory.freezed.dart';

@freezed
abstract class BibleDirectory with _$BibleDirectory {
  const factory BibleDirectory({
    final String title,
    final String id,
    final String category,
    final int index,
  }) = _BibleDirectory;
}
