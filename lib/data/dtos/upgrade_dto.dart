import 'package:json_annotation/json_annotation.dart';
part 'upgrade_dto.g.dart';

@JsonSerializable(createToJson: false)
class UpgradeDto {
  final int? id;
  final String? name;
  final String? imagePath;
  final int? lvl;
  final double? cost;
  final double? boost;

  factory UpgradeDto.fromJson(Map<String, dynamic> json) => _$UpgradeDtoFromJson(json);

  UpgradeDto(this.id, this.name, this.imagePath, this.lvl, this.cost, this.boost);
}
