import 'package:dio/dio.dart';
import 'package:ppa_mobile/app/data/services/cache_manager.dart';

import '../../services/configs/http.dart';
import '_base.dart';

class RitaseRepository extends BaseRepository with CacheManager {
  RitaseRepository(Dio dio) : super(dio);

  Future getRitase({String? idLmb}) {
    return requestApi(method: POST, url: '/api_lmb/get_ritase_lmb', data: {
      'id_lmb': idLmb,
    }).then((response) {
      return response.data;
    });
  }

  Future addRitase({String? idLmb, String? ritase, String? arah}) {
    final Map<String, dynamic> loged = getLogin();
    final data = {
      'id_lmb': idLmb,
      'id_user': loged['user_id'],
      'ritase': ritase,
      'arah': arah,
    };
    return requestApi(method: POST, url: '/api_lmb/insert_lmb_ritase', data: data).then((response) {
      return response.data;
    });
  }

  Future updatePenumpang({String? idLmbPpa, String? jmlPenumpang}) {
    final data = {
      'id_lmb_ppa': idLmbPpa,
      'jml_penumpang': jmlPenumpang,
    };
    return requestApi(method: POST, url: '/api_lmb/update_penumpang_ritase', data: data).then((response) {
      return response.data;
    });
  }

  Future deleteRitase({String? idLmbPpa, String? ritase}) {
    final data = {
      'id_lmb_ppa': idLmbPpa,
      'ritase': ritase,
    };
    return requestApi(method: POST, url: '/api_lmb/delete_ritase_lmb', data: data).then((response) {
      return response.data;
    });
  }

}
