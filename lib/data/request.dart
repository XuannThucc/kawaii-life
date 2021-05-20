import 'dart:async';
import 'package:dio/dio.dart';

import '/models/common/error_model.dart';
import '/utils/common/logger.dart';
import '/utils/constants/locale_key.dart';
import 'url_api.dart';

abstract class Constants {
  static const contentType = "application/json";
}

Map<MethodType, String> methods = {
  MethodType.GET: "GET",
  MethodType.POST: "POST"
};

class Request {
  Dio _dio = Dio();

  Request({String? base}) {
    if (base == null) base = environment.baseUrl;
    _dio = Dio(BaseOptions(
        baseUrl: base,
        receiveTimeout: environment.receiveTimeout,
        connectTimeout: environment.connectTimeout,
        contentType: Constants.contentType));
  }

  Future<Object> requestApi({
    required MethodType method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? header
  }) async {
    Logger.info("URL: " + url + "\n" + "body: " + data.toString());
    try {
      var response = await _dio.request(
        url,
        data: data,
        options: Options(method: methods[method], headers: header),
      );
      // Logger.info("Respone: " + response.toString());
      return response.data;
    } catch (e) {
      Logger.error(e.toString());
      return handleError(e);
    }
  }

  Future<ErrorModel> handleError(dynamic error) async {
    ErrorModel errorModel = ErrorModel();
    errorModel.message = error.toString();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          errorModel.description = LocaleKeys.request_send_timeout;
          break;
        case DioErrorType.cancel:
          errorModel.description = LocaleKeys.request_cancelled;
          break;
        case DioErrorType.connectTimeout:
          errorModel.description = LocaleKeys.request_connect_timeout;
          break;
        case DioErrorType.other:
          errorModel.description = LocaleKeys.no_internet;
          break;
        case DioErrorType.receiveTimeout:
          errorModel.description = LocaleKeys.request_receive_timeout;
          break;
        case DioErrorType.response:
          Logger.error(error.response!.toString());
          try {
            errorModel.code = error.response?.statusCode ?? errorModel.code;
            errorModel.description =
                error.response?.data ?? errorModel.description;
          } catch (e) {
            Logger.error(e.toString());
          }
          break;
      }
    }
    return errorModel;
  }
}
