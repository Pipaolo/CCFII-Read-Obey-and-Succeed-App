// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bible_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BibleChapterTearOff {
  const _$BibleChapterTearOff();

  _BibleChapter call(
      {String title, int number, List<BibleChapterContent> content}) {
    return _BibleChapter(
      title: title,
      number: number,
      content: content,
    );
  }
}

// ignore: unused_element
const $BibleChapter = _$BibleChapterTearOff();

mixin _$BibleChapter {
  String get title;
  int get number;
  List<BibleChapterContent> get content;

  $BibleChapterCopyWith<BibleChapter> get copyWith;
}

abstract class $BibleChapterCopyWith<$Res> {
  factory $BibleChapterCopyWith(
          BibleChapter value, $Res Function(BibleChapter) then) =
      _$BibleChapterCopyWithImpl<$Res>;
  $Res call({String title, int number, List<BibleChapterContent> content});
}

class _$BibleChapterCopyWithImpl<$Res> implements $BibleChapterCopyWith<$Res> {
  _$BibleChapterCopyWithImpl(this._value, this._then);

  final BibleChapter _value;
  // ignore: unused_field
  final $Res Function(BibleChapter) _then;

  @override
  $Res call({
    Object title = freezed,
    Object number = freezed,
    Object content = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      number: number == freezed ? _value.number : number as int,
      content: content == freezed
          ? _value.content
          : content as List<BibleChapterContent>,
    ));
  }
}

abstract class _$BibleChapterCopyWith<$Res>
    implements $BibleChapterCopyWith<$Res> {
  factory _$BibleChapterCopyWith(
          _BibleChapter value, $Res Function(_BibleChapter) then) =
      __$BibleChapterCopyWithImpl<$Res>;
  @override
  $Res call({String title, int number, List<BibleChapterContent> content});
}

class __$BibleChapterCopyWithImpl<$Res> extends _$BibleChapterCopyWithImpl<$Res>
    implements _$BibleChapterCopyWith<$Res> {
  __$BibleChapterCopyWithImpl(
      _BibleChapter _value, $Res Function(_BibleChapter) _then)
      : super(_value, (v) => _then(v as _BibleChapter));

  @override
  _BibleChapter get _value => super._value as _BibleChapter;

  @override
  $Res call({
    Object title = freezed,
    Object number = freezed,
    Object content = freezed,
  }) {
    return _then(_BibleChapter(
      title: title == freezed ? _value.title : title as String,
      number: number == freezed ? _value.number : number as int,
      content: content == freezed
          ? _value.content
          : content as List<BibleChapterContent>,
    ));
  }
}

class _$_BibleChapter implements _BibleChapter {
  const _$_BibleChapter({this.title, this.number, this.content});

  @override
  final String title;
  @override
  final int number;
  @override
  final List<BibleChapterContent> content;

  @override
  String toString() {
    return 'BibleChapter(title: $title, number: $number, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BibleChapter &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(content);

  @override
  _$BibleChapterCopyWith<_BibleChapter> get copyWith =>
      __$BibleChapterCopyWithImpl<_BibleChapter>(this, _$identity);
}

abstract class _BibleChapter implements BibleChapter {
  const factory _BibleChapter(
      {String title,
      int number,
      List<BibleChapterContent> content}) = _$_BibleChapter;

  @override
  String get title;
  @override
  int get number;
  @override
  List<BibleChapterContent> get content;
  @override
  _$BibleChapterCopyWith<_BibleChapter> get copyWith;
}
