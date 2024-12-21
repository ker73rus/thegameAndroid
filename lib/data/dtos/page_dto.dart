import 'package:json_annotation/json_annotation.dart';
import 'package:thegame/data/dtos/upgrade_dto.dart';

part 'page_dto.g.dart';

@JsonSerializable(createToJson: false)
class PageDto {
  final List<UpgradeDto>? items;
  final int? itemsCount;
  final int? totalItemsCount;
  final int? pageNumber;
  final int? itemsByPage;
  final int? prevPageNumber;
  final int? nextPageNumber;
  final int? firstPageNumber;
  final int? lastPageNumber;

  const PageDto(
      {this.items,
      this.itemsCount,
      this.totalItemsCount,
      this.pageNumber,
      this.itemsByPage,
      this.prevPageNumber,
      this.nextPageNumber,
      this.firstPageNumber,
      this.lastPageNumber});

  factory PageDto.fromJson(Map<String, dynamic> json) => _$PageDtoFromJson(json);
}
