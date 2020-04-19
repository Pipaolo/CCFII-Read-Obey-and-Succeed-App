// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'bible_directory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BibleDirectoryTearOff {
  const _$BibleDirectoryTearOff();

  _BibleDirectory call({String title, String id, String category, int index}) {
    return _BibleDirectory(
      title: title,
      id: id,
      category: category,
      index: index,
    );
  }
}

// ignore: unused_element
const $BibleDirectory = _$BibleDirectoryTearOff();

mixin _$BibleDirectory {
  String get title;
  String get id;
  String get category;
  int get index;

  $BibleDirectoryCopyWith<BibleDirectory> get copyWith;
}

abstract class $BibleDirectoryCopyWith<$Res> {
  factory $BibleDirectoryCopyWith(
          BibleDirectory value, $Res Function(BibleDirectory) then) =
      _$BibleDirectoryCopyWithImpl<$Res>;
  $Res call({String title, String id, String category, int index});
}

class _$BibleDirectoryCopyWithImpl<$Res>
    implements $BibleDirectoryCopyWith<$Res> {
  _$BibleDirectoryCopyWithImpl(this._value, this._then);

  final BibleDirectory _value;
  // ignore: unused_field
  final $Res Function(BibleDirectory) _then;

  @override
  $Res call({
    Object title = freezed,
    Object id = freezed,
    Object category = freezed,
    Object index = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      id: id == freezed ? _value.id : id as String,
      category: category == freezed ? _value.category : category as String,
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

abstract class _$BibleDirectoryCopyWith<$Res>
    implements $BibleDirectoryCopyWith<$Res> {
  factory _$BibleDirectoryCopyWith(
          _BibleDirectory value, $Res Function(_BibleDirectory) then) =
      __$BibleDirectoryCopyWithImpl<$Res>;
  @override
  $Res call({String title, String id, String category, int index});
}

class __$BibleDirectoryCopyWithImpl<$Res>
    extends _$BibleDirectoryCopyWithImpl<$Res>
    implements _$BibleDirectoryCopyWith<$Res> {
  __$BibleDirectoryCopyWithImpl(
      _BibleDirectory _value, $Res Function(_BibleDirectory) _then)
      : super(_value, (v) => _then(v as _BibleDirectory));

  @override
  _BibleDirectory get _value => super._value as _BibleDirectory;

  @override
  $Res call({
    Object title = freezed,
    Object id = freezed,
    Object category = freezed,
    Object index = freezed,
  }) {
    return _then(_BibleDirectory(
      title: title == freezed ? _value.title : title as String,
      id: id == freezed ? _value.id : id as String,
      category: category == freezed ? _value.category : category as String,
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

class _$_BibleDirectory implements _BibleDirectory {
  const _$_BibleDirectory({this.title, this.id, this.category, this.index});

  @override
  final String title;
  @override
  final String id;
  @override
  final String category;
  @override
  final int index;

  @override
  String toString() {
    return 'BibleDirectory(title: $title, id: $id, category: $category, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BibleDirectory &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(index);

  @override
  _$BibleDirectoryCopyWith<_BibleDirectory> get copyWith =>
      __$BibleDirectoryCopyWithImpl<_BibleDirectory>(this, _$identity);
}

abstract class _BibleDirectory implements BibleDirectory {
  const factory _BibleDirectory(
      {String title,
      String id,
      String category,
      int index}) = _$_BibleDirectory;

  @override
  String get title;
  @override
  String get id;
  @override
  String get category;
  @override
  int get index;
  @override
  _$BibleDirectoryCopyWith<_BibleDirectory> get copyWith;
}
