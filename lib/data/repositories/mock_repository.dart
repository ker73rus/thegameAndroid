import 'package:thegame/domain/models/card.dart';
import 'package:thegame/data/repositories/api_interface.dart';
import 'package:thegame/domain/models/home.dart';

class MockRepository extends ApiInterface {
  @override
  Future<HomeData?> loadData({OnErrorCallback? onError, String? q, int pageNumber = 0}) {
    // TODO: implement loadData
    throw UnimplementedError();
  }
}
