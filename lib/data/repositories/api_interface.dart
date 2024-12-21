import 'package:thegame/domain/models/home.dart';

typedef OnErrorCallback = void Function(String? error);

abstract class ApiInterface {
  Future<HomeData?> loadData({OnErrorCallback? onError, String? q, int pageNumber});
}
