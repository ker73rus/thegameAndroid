import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:thegame/data/dtos/character_dto.dart';
import 'package:thegame/data/mappers/characters_mapper.dart';
import 'package:thegame/domain/models/card.dart';
import 'package:thegame/data/repositories/api_interface.dart';
import 'package:thegame/domain/models/home.dart';

class PotterRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
  static const String _baseUrl = 'https://api.potterdb.com';
  @override
  Future<HomeData?> loadData(
      {OnErrorCallback? onError, String? q, int pageNumber = 0, int itemsByPage = 5}) async {
    try {
      const String url = '$_baseUrl/v1/characters';
      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(url,
          queryParameters: q != null ? {'filter[name_cont': q} : null);
      final CharactersDto dto = CharactersDto.fromJson(response.data as Map<String, dynamic>);
      final List<CardData>? data = dto.data?.map((e) => e.toDomain()).toList();
      return HomeData(data: data);
    } on DioException catch (e) {
      print(e);
      return null;
    }
  }
}
