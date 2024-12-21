import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:thegame/data/dtos/page_dto.dart';
import 'package:thegame/data/dtos/upgrade_dto.dart';
import 'package:thegame/data/mappers/upgrade_mapper.dart';
import 'package:thegame/data/repositories/api_interface.dart';
import 'package:thegame/domain/models/card.dart';
import 'package:thegame/domain/models/home.dart';
import 'package:thegame/presentation/home_page/home_page.dart';

class ThegameRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
  static const String _baseUrl = 'http://192.168.0.102:5067/api';

  @override
  Future<HomeData?> loadData(
      {OnErrorCallback? onError, String? q, int pageNumber = 1, int itemsByPage = 3}) async {
    try {
      Map<String, dynamic> queryParameters = {
        'page': pageNumber,
        'pageSize': itemsByPage,
        'name': q
      };
      const String url = '$_baseUrl/Upgrade/GetMany';
      final List<CardData> data = [];
      final Response<dynamic> response =
          await _dio.get<List<dynamic>>(url, queryParameters: queryParameters);
      final upgrades = response.data as List<dynamic>;
      for (dynamic upg in upgrades) {
        final UpgradeDto upgradeDto = UpgradeDto.fromJson(upg);
        data.add(upgradeDto.toDomain());
      }
      HomeData homeData =
          HomeData(data: data, pageNumber: pageNumber, nextPageNumber: pageNumber + 1);

      return homeData;
    } on DioException catch (e) {
      onError?.call(e.response?.statusMessage);
      onError?.call(e.error?.toString());
      print(e.error.toString());
      return null;
    }
  }
}
