// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MainStateCWProxy {
  MainState data(MainData data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainState(...).copyWith(id: 12, name: "My name")
  /// ````
  MainState call({
    MainData data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMainState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMainState.copyWith.fieldName(...)`
class _$MainStateCWProxyImpl implements _$MainStateCWProxy {
  const _$MainStateCWProxyImpl(this._value);

  final MainState _value;

  @override
  MainState data(MainData data) => this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainState(...).copyWith(id: 12, name: "My name")
  /// ````
  MainState call({
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return MainState(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as MainData,
    );
  }
}

extension $MainStateCopyWith on MainState {
  /// Returns a callable class that can be used as follows: `instanceOfMainState.copyWith(...)` or like so:`instanceOfMainState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MainStateCWProxy get copyWith => _$MainStateCWProxyImpl(this);
}
