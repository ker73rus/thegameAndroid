// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeDto _$UpgradeDtoFromJson(Map<String, dynamic> json) => UpgradeDto(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['imagePath'] as String?,
      (json['lvl'] as num?)?.toInt(),
      (json['cost'] as num?)?.toDouble(),
      (json['boost'] as num?)?.toDouble(),
    );
