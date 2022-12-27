import 'dart:async';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:reduxdemo/core/constant/url_constant.dart';
import 'package:reduxdemo/core/error/exceptions.dart';
import 'package:reduxdemo/model/login/login_request.dart';
import 'package:reduxdemo/model/login/login_response.dart';

class AppClient {
  DioSingleton dioSingleton;

  AppClient() {
    dioSingleton = DioSingleton();
  }

  Future<LoginResponse> login(String url, LoginRequest data) async {
    final response = await dioSingleton.dio.post(url, data: data);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}

class DioSingleton {
  Dio dio;
  static DioSingleton _dioSingleton = DioSingleton._internal();

  DioSingleton._internal() {
    BaseOptions baseOptions = BaseOptions(baseUrl: UrlConstant.BASE_URL);
    dio = Dio(baseOptions);
  }

  factory DioSingleton() {
    return _dioSingleton;
  }
}
