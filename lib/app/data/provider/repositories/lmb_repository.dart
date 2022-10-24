import 'package:dio/dio.dart';
import 'package:ppa_mobile/app/data/services/cache_manager.dart';

import '../../services/configs/http.dart';
import '_base.dart';

class LmbRepository extends BaseRepository with CacheManager {
  LmbRepository(Dio dio) : super(dio);

  Future getPointPPA() {
    final Map<String, dynamic> loged = getLogin();
    return requestApi(method: POST, url: '/api_lmb/get_combobox_point', data: {
      'id_user': loged['user_id'],
    }).then((response) {
      return response.data;
    });
  }

  Future getLMB(String? idPoint) {
    return requestApi(method: POST, url: '/api_lmb/get_lmb', data: {
      'id_point': idPoint,
    }).then((response) {
      return response.data;
    });
  }
}
