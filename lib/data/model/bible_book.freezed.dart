// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bible_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BibleBookTearOff {
  const _$BibleBookTearOff();

  _BibleBook call(
      {String title,
      String category,
      int numberOfChapters,
      String id,
      List<BibleChapter> chapters}) {
    return _BibleBook(
      title: title,
      category: category,
      numberOfChapters: numberOfChapters,
      id: id,
      chapters: chapters,
    );
  }
}

// ignore: unused_element
const $BibleBook = _$BibleBookTearOff();

mixin _$BibleBook {
  String get title;
  String get category;
  int get numberOfChapters;
  String get id;
  List<BibleChapter> get chapters;

  $BibleBookCopyWith<BibleBook> get copyWith;
}

abstract class $BibleBookCopyWith<$Res> {
  factory $BibleBookCopyWith(BibleBook value, $Res Function(BibleBook) then) =
      _$BibleBookCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String category,
      int numberOfChapters,
      String id,
      List<BibleChapter> chapters});
}

class _$BibleBookCopyWithImpl<$Res> implements $BibleBookCopyWith<$Res> {
  _$BibleBookCopyWithImpl(this._value, this._then);

  final BibleBook _value;
  // ignore: unused_field
  final $Res Function(BibleBook) _then;

  @override
  $Res call({
    Object title = freezed,
    Object category = freezed,
    Object numberOfChapters = freezed,
    Object id = freezed,
    Object chapters = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      category: category == freezed ? _value.category : category as String,
      numberOfChapters: numberOfChapters == freezed
          ? _value.numberOfChapters
          : numberOfChapters as int,
      id: id == freezed ? _value.id : id as String,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters as List<BibleChapter>,
    ));
  }
}

abstract class _$BibleBookCopyWith<$Res> implements $BibleBookCopyWith<$Res> {
  factory _$BibleBookCopyWith(
          _BibleBook value, $Res Function(_BibleBook) then) =
      __$BibleBookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String category,
      int numberOfChapters,
      String id,
      List<BibleChapter> chapters});
}

class __$BibleBookCopyWithImpl<$Res> extends _$BibleBookCopyWithImpl<$Res>
    implements _$BibleBookCopyWith<$Res> {
  __$BibleBookCopyWithImpl(_BibleBook _value, $Res Function(_BibleBook) _then)
      : super(_value, (v) => _then(v as _BibleBook));

  @override
  _BibleBook get _value => super._value as _BibleBook;

  @override
  $Res call({
    Object title = freezed,
    Object category = freezed,
    Object numberOfChapters = freezed,
    Object id = freezed,
    Object chapters = freezed,
  }) {
    return _then(_BibleBook(
      title: title == freezed ? _value.title : title as String,
      category: category == freezed ? _value.category : category as String,
      numberOfChapters: numberOfChapters == freezed
          ? _value.numberOfChapters
          : numberOfChapters as int,
      id: id == freezed ? _value.id : id as String,
      chapters: chapters == freezed
          ? _value.chapters
          : chapters as List<BibleChapter>,
    ));
  }
}

class _$_BibleBook implements _BibleBook {
  const _$_BibleBook(
      {this.title,
      this.category,
      this.numberOfChapters,
      this.id,
      this.chapters});

  @override
  final String title;
  @override
  final String category;
  @override
  final int numberOfChapters;
  @override
  final String id;
  @override
  final List<BibleChapter> chapters;

  @override
  String toString() {
    return 'BibleBook(title: $title, category: $category, numberOfChapters: $numberOfChapters, id: $id, chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BibleBook &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.numberOfChapters, numberOfChapters) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfChapters, numberOfChapters)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.chapters, chapters) ||
                const DeepCollectionEquality()
                    .equals(other.chapters, chapters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(numberOfChapters) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(chapters);

  @override
  _$BibleBookCopyWith<_BibleBook> get copyWith =>
      __$BibleBookCopyWithImpl<_BibleBook>(this, _$identity);
}

abstract class _BibleBook implements BibleBook {
  const factory _BibleBook(
      {String title,
      String category,
      int numberOfChapters,
      String id,
      List<BibleChapter> chapters}) = _$_BibleBook;

  @override
  String get title;
  @override
  String get category;
  @override
  int get numberOfChapters;
  @override
  String get id;
  @override
  List<BibleChapter> get chapters;
  @override
  _$BibleBookCopyWith<_BibleBook> get copyWith;
}
