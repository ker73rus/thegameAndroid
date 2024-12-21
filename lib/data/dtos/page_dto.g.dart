// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageDto _$PageDtoFromJson(Map<String, dynamic> json) => PageDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => UpgradeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['itemsCount'] as num?)?.toInt(),
      totalItemsCount: (json['totalItemsCount'] as num?)?.toInt(),
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      itemsByPage: (json['itemsByPage'] as num?)?.toInt(),
      prevPageNumber: (json['prevPageNumber'] as num?)?.toInt(),
      nextPageNumber: (json['nextPageNumber'] as num?)?.toInt(),
      firstPageNumber: (json['firstPageNumber'] as num?)?.toInt(),
      lastPageNumber: (json['lastPageNumber'] as num?)?.toInt(),
    );
