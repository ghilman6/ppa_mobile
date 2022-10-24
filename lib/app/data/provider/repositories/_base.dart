import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/configs/http.dart';
import '../../models/responses/base_response.dart';

class BaseRepository {
  final Dio? _dio;

  BaseRepository(this._dio);

  @protected
  Future<BaseResponse> requestApi({
    required String method,
    required String url,
    String? idToken = '',
    Map<String, dynamic>? queryParam,
    Options? options,
    dynamic data,
  }) async {
    BaseResponse response =
        BaseResponse(code: HTTP_INTERNAL_SERVER_ERROR, status: false);

    try {
      response = await _sendRequest(
        method: method,
        url: url,
        idToken: idToken!,
        queryParam: queryParam,
        options: options,
        data: data,
      );

      return response;
    } catch (e) {
      debugPrint('Error from base repository $e');
      return response;
    }
  }

  Future<BaseResponse> _sendRequest({
    required String method,
    required String url,
    String? idToken,
    Map<String, dynamic>? queryParam,
    Options? options,
    dynamic data,
  }) async {
    try {
      Future<Response<dynamic>> apiReturn;

      options ??= Options(headers: {});

      /* if (idToken != null) {
        if (idToken.trim().isNotEmpty) {
          //options.headers!['Authorization'] = 'Bearer $idToken';
          //options.headers!['Authorization_Token'] = idToken;
        }
      } */

      if (method == GET) {
        apiReturn =
            _dio!.get(url, queryParameters: queryParam, options: options);
      } else if (method == POST) {
        options.headers!['content-type'] = Headers.formUrlEncodedContentType;
        apiReturn = _dio!.post(url,
            queryParameters: queryParam, options: options, data: data);
      } else if (method == PUT) {
        apiReturn = _dio!.put(url,
            queryParameters: queryParam, options: options, data: data);
      } else {
        options.headers!['content-type'] = Headers.formUrlEncodedContentType;
        apiReturn = _dio!.delete(url,
            queryParameters: queryParam, options: options, data: data);
      }

      return await apiReturn.then((resp) {
        // error status code
        if (resp.statusCode! >= 300) {
          return BaseResponse(
            code: resp.statusCode,
            status: false,
            message: resp.statusMessage,
          );
        }

        if (url == '/api_login/login' || url == '/api_login/check_login') {
          final cookies = resp.headers.map['set-cookie'];
          if (cookies != null) {
            final authToken = cookies[0].split(';')[0];
            final box = GetStorage();
            box.write('cookie', authToken);
          }
        }

        return BaseResponse(
          code: resp.statusCode,
          status: true,
          message: resp.statusMessage,
          data: resp.data,
        );
      });
    } on DioError catch (ex) {
      Map<String, dynamic> data = {
        'code': HTTP_INTERNAL_SERVER_ERROR,
        'status': false,
      };
      debugPrint('Error on request to $url');
      if (ex.type == DioErrorType.connectTimeout) {
        data['message'] = 'Error Connection Timeout Exception';
        debugPrint('Error Connection Timeout Exception ${ex.message}');
        // throw Exception("Connection  Timeout Exception");
      } else {
        debugPrint('Error Exception ${ex.message}');
        data['message'] = 'Server error';
        if (ex.response != null) {
          if (ex.response!.data is Map) {
            debugPrint('Error Exception response data ${ex.response!.data}');
            //data = ex.response!.data;
            data['message'] = '${ex.response!.data['message']}';
          }
        } else {
          data['message'] = 'Server error';
          debugPrint('Error $ex');
          debugPrint('Error Message ${ex.message}');
        }
        // throw Exception(ex.message);
      }

      return BaseResponse(
        code: HTTP_INTERNAL_SERVER_ERROR,
        status: false,
        data: data,
      );
    }
  }
}
