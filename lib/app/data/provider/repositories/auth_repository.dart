import 'package:dio/dio.dart';

import '../../services/configs/http.dart';
import '_base.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(Dio dio) : super(dio);

  Future login(String nik, String password) {
    return requestApi(method: POST, url: '/api_login/login', data: {
      'username': nik,
      'password': password,
    }).then((response) {
      return response.data;
    });
  }

  Future checkLogin() {
    return requestApi(
      method: GET,
      url: '/api_login/check_login',
    ).then((response) {
      Interceptors();
      return response.data;
    });
  }

  Future logout() {
    return requestApi(method: GET, url: '/api_login/logout').then((response) {
      return response.data;
    });
  }
}
