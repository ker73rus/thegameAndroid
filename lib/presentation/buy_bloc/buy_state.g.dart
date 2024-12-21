// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BuyStateCWProxy {
  BuyState idsToLvl(Map<String, String>? idsToLvl);

  BuyState buyedIds(List<String>? buyedIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BuyState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BuyState(...).copyWith(id: 12, name: "My name")
  /// ````
  BuyState call({
    Map<String, String>? idsToLvl,
    List<String>? buyedIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBuyState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBuyState.copyWith.fieldName(...)`
class _$BuyStateCWProxyImpl implements _$BuyStateCWProxy {
  const _$BuyStateCWProxyImpl(this._value);

  final BuyState _value;

  @override
  BuyState idsToLvl(Map<String, String>? idsToLvl) => this(idsToLvl: idsToLvl);

  @override
  BuyState buyedIds(List<String>? buyedIds) => this(buyedIds: buyedIds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BuyState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BuyState(...).copyWith(id: 12, name: "My name")
  /// ````
  BuyState call({
    Object? idsToLvl = const $CopyWithPlaceholder(),
    Object? buyedIds = const $CopyWithPlaceholder(),
  }) {
    return BuyState(
      idsToLvl: idsToLvl == const $CopyWithPlaceholder()
          ? _value.idsToLvl
          // ignore: cast_nullable_to_non_nullable
          : idsToLvl as Map<String, String>?,
      buyedIds: buyedIds == const $CopyWithPlaceholder()
          ? _value.buyedIds
          // ignore: cast_nullable_to_non_nullable
          : buyedIds as List<String>?,
    );
  }
}

extension $BuyStateCopyWith on BuyState {
  /// Returns a callable class that can be used as follows: `instanceOfBuyState.copyWith(...)` or like so:`instanceOfBuyState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BuyStateCWProxy get copyWith => _$BuyStateCWProxyImpl(this);
}
