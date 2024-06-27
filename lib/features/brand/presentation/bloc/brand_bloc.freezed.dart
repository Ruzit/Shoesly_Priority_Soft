// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getBrandList,
    required TResult Function(String brandName) getSpecificBrand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getBrandList,
    TResult? Function(String brandName)? getSpecificBrand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getBrandList,
    TResult Function(String brandName)? getSpecificBrand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetBrandList value) getBrandList,
    required TResult Function(_GetSpecificBrand value) getSpecificBrand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetBrandList value)? getBrandList,
    TResult? Function(_GetSpecificBrand value)? getSpecificBrand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetBrandList value)? getBrandList,
    TResult Function(_GetSpecificBrand value)? getSpecificBrand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandEventCopyWith<$Res> {
  factory $BrandEventCopyWith(
          BrandEvent value, $Res Function(BrandEvent) then) =
      _$BrandEventCopyWithImpl<$Res, BrandEvent>;
}

/// @nodoc
class _$BrandEventCopyWithImpl<$Res, $Val extends BrandEvent>
    implements $BrandEventCopyWith<$Res> {
  _$BrandEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$BrandEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'BrandEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getBrandList,
    required TResult Function(String brandName) getSpecificBrand,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getBrandList,
    TResult? Function(String brandName)? getSpecificBrand,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getBrandList,
    TResult Function(String brandName)? getSpecificBrand,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetBrandList value) getBrandList,
    required TResult Function(_GetSpecificBrand value) getSpecificBrand,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetBrandList value)? getBrandList,
    TResult? Function(_GetSpecificBrand value)? getSpecificBrand,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetBrandList value)? getBrandList,
    TResult Function(_GetSpecificBrand value)? getSpecificBrand,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BrandEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetBrandListImplCopyWith<$Res> {
  factory _$$GetBrandListImplCopyWith(
          _$GetBrandListImpl value, $Res Function(_$GetBrandListImpl) then) =
      __$$GetBrandListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBrandListImplCopyWithImpl<$Res>
    extends _$BrandEventCopyWithImpl<$Res, _$GetBrandListImpl>
    implements _$$GetBrandListImplCopyWith<$Res> {
  __$$GetBrandListImplCopyWithImpl(
      _$GetBrandListImpl _value, $Res Function(_$GetBrandListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBrandListImpl implements _GetBrandList {
  const _$GetBrandListImpl();

  @override
  String toString() {
    return 'BrandEvent.getBrandList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBrandListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getBrandList,
    required TResult Function(String brandName) getSpecificBrand,
  }) {
    return getBrandList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getBrandList,
    TResult? Function(String brandName)? getSpecificBrand,
  }) {
    return getBrandList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getBrandList,
    TResult Function(String brandName)? getSpecificBrand,
    required TResult orElse(),
  }) {
    if (getBrandList != null) {
      return getBrandList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetBrandList value) getBrandList,
    required TResult Function(_GetSpecificBrand value) getSpecificBrand,
  }) {
    return getBrandList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetBrandList value)? getBrandList,
    TResult? Function(_GetSpecificBrand value)? getSpecificBrand,
  }) {
    return getBrandList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetBrandList value)? getBrandList,
    TResult Function(_GetSpecificBrand value)? getSpecificBrand,
    required TResult orElse(),
  }) {
    if (getBrandList != null) {
      return getBrandList(this);
    }
    return orElse();
  }
}

abstract class _GetBrandList implements BrandEvent {
  const factory _GetBrandList() = _$GetBrandListImpl;
}

/// @nodoc
abstract class _$$GetSpecificBrandImplCopyWith<$Res> {
  factory _$$GetSpecificBrandImplCopyWith(_$GetSpecificBrandImpl value,
          $Res Function(_$GetSpecificBrandImpl) then) =
      __$$GetSpecificBrandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String brandName});
}

/// @nodoc
class __$$GetSpecificBrandImplCopyWithImpl<$Res>
    extends _$BrandEventCopyWithImpl<$Res, _$GetSpecificBrandImpl>
    implements _$$GetSpecificBrandImplCopyWith<$Res> {
  __$$GetSpecificBrandImplCopyWithImpl(_$GetSpecificBrandImpl _value,
      $Res Function(_$GetSpecificBrandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandName = null,
  }) {
    return _then(_$GetSpecificBrandImpl(
      null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSpecificBrandImpl implements _GetSpecificBrand {
  const _$GetSpecificBrandImpl(this.brandName);

  @override
  final String brandName;

  @override
  String toString() {
    return 'BrandEvent.getSpecificBrand(brandName: $brandName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSpecificBrandImpl &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSpecificBrandImplCopyWith<_$GetSpecificBrandImpl> get copyWith =>
      __$$GetSpecificBrandImplCopyWithImpl<_$GetSpecificBrandImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getBrandList,
    required TResult Function(String brandName) getSpecificBrand,
  }) {
    return getSpecificBrand(brandName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getBrandList,
    TResult? Function(String brandName)? getSpecificBrand,
  }) {
    return getSpecificBrand?.call(brandName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getBrandList,
    TResult Function(String brandName)? getSpecificBrand,
    required TResult orElse(),
  }) {
    if (getSpecificBrand != null) {
      return getSpecificBrand(brandName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetBrandList value) getBrandList,
    required TResult Function(_GetSpecificBrand value) getSpecificBrand,
  }) {
    return getSpecificBrand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetBrandList value)? getBrandList,
    TResult? Function(_GetSpecificBrand value)? getSpecificBrand,
  }) {
    return getSpecificBrand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetBrandList value)? getBrandList,
    TResult Function(_GetSpecificBrand value)? getSpecificBrand,
    required TResult orElse(),
  }) {
    if (getSpecificBrand != null) {
      return getSpecificBrand(this);
    }
    return orElse();
  }
}

abstract class _GetSpecificBrand implements BrandEvent {
  const factory _GetSpecificBrand(final String brandName) =
      _$GetSpecificBrandImpl;

  String get brandName;
  @JsonKey(ignore: true)
  _$$GetSpecificBrandImplCopyWith<_$GetSpecificBrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BrandState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<BrandModel> brandList) success,
    required TResult Function(BrandModel brand) getSpecificBrandsuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<BrandModel> brandList)? success,
    TResult? Function(BrandModel brand)? getSpecificBrandsuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMsg)? error,
    TResult Function(List<BrandModel> brandList)? success,
    TResult Function(BrandModel brand)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_GetSpecificBrandSuccess value)
        getSpecificBrandsuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) then) =
      _$BrandStateCopyWithImpl<$Res, BrandState>;
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res, $Val extends BrandState>
    implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BrandState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<BrandModel> brandList) success,
    required TResult Function(BrandModel brand) getSpecificBrandsuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<BrandModel> brandList)? success,
    TResult? Function(BrandModel brand)? getSpecificBrandsuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMsg)? error,
    TResult Function(List<BrandModel> brandList)? success,
    TResult Function(BrandModel brand)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_GetSpecificBrandSuccess value)
        getSpecificBrandsuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BrandState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BrandState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<BrandModel> brandList) success,
    required TResult Function(BrandModel brand) getSpecificBrandsuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<BrandModel> brandList)? success,
    TResult? Function(BrandModel brand)? getSpecificBrandsuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMsg)? error,
    TResult Function(List<BrandModel> brandList)? success,
    TResult Function(BrandModel brand)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_GetSpecificBrandSuccess value)
        getSpecificBrandsuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BrandState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
  }) {
    return _then(_$ErrorImpl(
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'BrandState.error(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<BrandModel> brandList) success,
    required TResult Function(BrandModel brand) getSpecificBrandsuccess,
  }) {
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<BrandModel> brandList)? success,
    TResult? Function(BrandModel brand)? getSpecificBrandsuccess,
  }) {
    return error?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMsg)? error,
    TResult Function(List<BrandModel> brandList)? success,
    TResult Function(BrandModel brand)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_GetSpecificBrandSuccess value)
        getSpecificBrandsuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BrandState {
  const factory _Error({required final String errorMsg}) = _$ErrorImpl;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BrandModel> brandList});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandList = null,
  }) {
    return _then(_$SuccessImpl(
      brandList: null == brandList
          ? _value._brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required final List<BrandModel> brandList})
      : _brandList = brandList;

  final List<BrandModel> _brandList;
  @override
  List<BrandModel> get brandList {
    if (_brandList is EqualUnmodifiableListView) return _brandList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brandList);
  }

  @override
  String toString() {
    return 'BrandState.success(brandList: $brandList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._brandList, _brandList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_brandList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<BrandModel> brandList) success,
    required TResult Function(BrandModel brand) getSpecificBrandsuccess,
  }) {
    return success(brandList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<BrandModel> brandList)? success,
    TResult? Function(BrandModel brand)? getSpecificBrandsuccess,
  }) {
    return success?.call(brandList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMsg)? error,
    TResult Function(List<BrandModel> brandList)? success,
    TResult Function(BrandModel brand)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(brandList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_GetSpecificBrandSuccess value)
        getSpecificBrandsuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements BrandState {
  const factory _Success({required final List<BrandModel> brandList}) =
      _$SuccessImpl;

  List<BrandModel> get brandList;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSpecificBrandSuccessImplCopyWith<$Res> {
  factory _$$GetSpecificBrandSuccessImplCopyWith(
          _$GetSpecificBrandSuccessImpl value,
          $Res Function(_$GetSpecificBrandSuccessImpl) then) =
      __$$GetSpecificBrandSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BrandModel brand});
}

/// @nodoc
class __$$GetSpecificBrandSuccessImplCopyWithImpl<$Res>
    extends _$BrandStateCopyWithImpl<$Res, _$GetSpecificBrandSuccessImpl>
    implements _$$GetSpecificBrandSuccessImplCopyWith<$Res> {
  __$$GetSpecificBrandSuccessImplCopyWithImpl(
      _$GetSpecificBrandSuccessImpl _value,
      $Res Function(_$GetSpecificBrandSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
  }) {
    return _then(_$GetSpecificBrandSuccessImpl(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandModel,
    ));
  }
}

/// @nodoc

class _$GetSpecificBrandSuccessImpl implements _GetSpecificBrandSuccess {
  const _$GetSpecificBrandSuccessImpl({required this.brand});

  @override
  final BrandModel brand;

  @override
  String toString() {
    return 'BrandState.getSpecificBrandsuccess(brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSpecificBrandSuccessImpl &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSpecificBrandSuccessImplCopyWith<_$GetSpecificBrandSuccessImpl>
      get copyWith => __$$GetSpecificBrandSuccessImplCopyWithImpl<
          _$GetSpecificBrandSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMsg) error,
    required TResult Function(List<BrandModel> brandList) success,
    required TResult Function(BrandModel brand) getSpecificBrandsuccess,
  }) {
    return getSpecificBrandsuccess(brand);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String errorMsg)? error,
    TResult? Function(List<BrandModel> brandList)? success,
    TResult? Function(BrandModel brand)? getSpecificBrandsuccess,
  }) {
    return getSpecificBrandsuccess?.call(brand);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMsg)? error,
    TResult Function(List<BrandModel> brandList)? success,
    TResult Function(BrandModel brand)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (getSpecificBrandsuccess != null) {
      return getSpecificBrandsuccess(brand);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_GetSpecificBrandSuccess value)
        getSpecificBrandsuccess,
  }) {
    return getSpecificBrandsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
  }) {
    return getSpecificBrandsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_GetSpecificBrandSuccess value)? getSpecificBrandsuccess,
    required TResult orElse(),
  }) {
    if (getSpecificBrandsuccess != null) {
      return getSpecificBrandsuccess(this);
    }
    return orElse();
  }
}

abstract class _GetSpecificBrandSuccess implements BrandState {
  const factory _GetSpecificBrandSuccess({required final BrandModel brand}) =
      _$GetSpecificBrandSuccessImpl;

  BrandModel get brand;
  @JsonKey(ignore: true)
  _$$GetSpecificBrandSuccessImplCopyWith<_$GetSpecificBrandSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
