// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bible_chapter_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BibleChapterContentTearOff {
  const _$BibleChapterContentTearOff();

  _BibleChapterContent call({String passageTitle, int verse, String text}) {
    return _BibleChapterContent(
      passageTitle: passageTitle,
      verse: verse,
      text: text,
    );
  }
}

// ignore: unused_element
const $BibleChapterContent = _$BibleChapterContentTearOff();

mixin _$BibleChapterContent {
  String get passageTitle;
  int get verse;
  String get text;

  $BibleChapterContentCopyWith<BibleChapterContent> get copyWith;
}

abstract class $BibleChapterContentCopyWith<$Res> {
  factory $BibleChapterContentCopyWith(
          BibleChapterContent value, $Res Function(BibleChapterContent) then) =
      _$BibleChapterContentCopyWithImpl<$Res>;
  $Res call({String passageTitle, int verse, String text});
}

class _$BibleChapterContentCopyWithImpl<$Res>
    implements $BibleChapterContentCopyWith<$Res> {
  _$BibleChapterContentCopyWithImpl(this._value, this._then);

  final BibleChapterContent _value;
  // ignore: unused_field
  final $Res Function(BibleChapterContent) _then;

  @override
  $Res call({
    Object passageTitle = freezed,
    Object verse = freezed,
    Object text = freezed,
  }) {
    return _then(_value.copyWith(
      passageTitle: passageTitle == freezed
          ? _value.passageTitle
          : passageTitle as String,
      verse: verse == freezed ? _value.verse : verse as int,
      text: text == freezed ? _value.text : text as String,
    ));
  }
}

abstract class _$BibleChapterContentCopyWith<$Res>
    implements $BibleChapterContentCopyWith<$Res> {
  factory _$BibleChapterContentCopyWith(_BibleChapterContent value,
          $Res Function(_BibleChapterContent) then) =
      __$BibleChapterContentCopyWithImpl<$Res>;
  @override
  $Res call({String passageTitle, int verse, String text});
}

class __$BibleChapterContentCopyWithImpl<$Res>
    extends _$BibleChapterContentCopyWithImpl<$Res>
    implements _$BibleChapterContentCopyWith<$Res> {
  __$BibleChapterContentCopyWithImpl(
      _BibleChapterContent _value, $Res Function(_BibleChapterContent) _then)
      : super(_value, (v) => _then(v as _BibleChapterContent));

  @override
  _BibleChapterContent get _value => super._value as _BibleChapterContent;

  @override
  $Res call({
    Object passageTitle = freezed,
    Object verse = freezed,
    Object text = freezed,
  }) {
    return _then(_BibleChapterContent(
      passageTitle: passageTitle == freezed
          ? _value.passageTitle
          : passageTitle as String,
      verse: verse == freezed ? _value.verse : verse as int,
      text: text == freezed ? _value.text : text as String,
    ));
  }
}

class _$_BibleChapterContent implements _BibleChapterContent {
  const _$_BibleChapterContent({this.passageTitle, this.verse, this.text});

  @override
  final String passageTitle;
  @override
  final int verse;
  @override
  final String text;

  @override
  String toString() {
    return 'BibleChapterContent(passageTitle: $passageTitle, verse: $verse, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BibleChapterContent &&
            (identical(other.passageTitle, passageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.passageTitle, passageTitle)) &&
            (identical(other.verse, verse) ||
                const DeepCollectionEquality().equals(other.verse, verse)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(passageTitle) ^
      const DeepCollectionEquality().hash(verse) ^
      const DeepCollectionEquality().hash(text);

  @override
  _$BibleChapterContentCopyWith<_BibleChapterContent> get copyWith =>
      __$BibleChapterContentCopyWithImpl<_BibleChapterContent>(
          this, _$identity);
}

abstract class _BibleChapterContent implements BibleChapterContent {
  const factory _BibleChapterContent(
      {String passageTitle, int verse, String text}) = _$_BibleChapterContent;

  @override
  String get passageTitle;
  @override
  int get verse;
  @override
  String get text;
  @override
  _$BibleChapterContentCopyWith<_BibleChapterContent> get copyWith;
}
