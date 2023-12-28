import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:wasikuna_admin/core/environment/env.dart';
import 'package:wasikuna_admin/core/network/interceptors/logger_interceptor.dart';

class DioClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Environment.appConfig["baseUrl"],
      connectTimeout:
          Duration(milliseconds: Environment.appConfig["connectTimeout"]),
      receiveTimeout:
          Duration(milliseconds: Environment.appConfig["receiveTimeout"]),
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([
      LoggerInterceptor(),
    ]);

  /// [POST]
  Future<Response<dynamic>> post({
    String path = '',
    String? token,
    String? contentType,
    Map<String, String>? headers,
    FormData? formData,
    Map<String, dynamic>? bodyRaw,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    //final token = await StorageService.get(Keys.KeyToken);
    interceptorHeader(headers: headers, token: token);
    final response = await _dio
        .post(path,
            data: bodyRaw ?? formData, //
            options: Options(method: 'POST', contentType: contentType),
            queryParameters: queryParameters)
        .catchError((error) {
      DioException dioError = error;
      return dioError.response!;
    }).timeout(
      _dio.options.connectTimeout!,
      onTimeout: () {
        throw Exception(['TIME_OUT']);
      },
    );
    return response;
  }

  /// [PUT]
  Future<Response<dynamic>> put(
      {String path = '',
      String? token,
      Map<String, String>? headers,
      Map<String, dynamic>? formData,
      Map<String, dynamic>? bodyRaw,
      Map<String, dynamic>? queryParameters}) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    //final token = await StorageService.get(Keys.KeyToken);
    interceptorHeader(headers: headers, token: token);
    final response = await _dio
        .put(path,
            data: bodyRaw ?? FormData.fromMap(formData!),
            options: Options(method: 'PUT'),
            queryParameters: queryParameters)
        .catchError((error) {
      DioException dioError = error;
      return dioError.response!.data;
    }).timeout(
      _dio.options.connectTimeout!,
      onTimeout: () {
        throw Exception(['TIME_OUT']);
      },
    );
    return response;
  }

  /// [GET]
  Future<Response<dynamic>> get({
    String path = '',
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
  }) async {
    if (!await _checkInternetConnection()) {
      throw Exception(['NOT_INTERNET_EXCEPTION']);
    }
    //final token = await StorageService.get(Keys.KeyToken);
    interceptorHeader(headers: headers, token: token);
    _dio.options.followRedirects = true;
    return _dio
        .get(
      path,
      options: Options(
          method: 'GET',
          responseType: responseType ?? ResponseType.json,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
          }),
      queryParameters: queryParameters,
    )
        .then((Response response) {
      return response;
    }).catchError((error) {
      DioException dioError = error;
      if (dioError.response?.statusCode != 500) {
        // ignore: invalid_return_type_for_catch_error
        return dioError.response!.statusMessage;
      } else {
        throw Exception('SERVER_ERROR');
      }
    }).timeout(_dio.options.connectTimeout!, onTimeout: () {
      throw Exception(['TIME_OUT']);
    });
  }

  /// [DELETED]
  void interceptorHeader({
    Map<String, String>? headers,
    String? token,
  }) {
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    if (token != null) {
      _dio.options.headers.addAll({"Authorization": "Bearer $token"});
    } else {
      _dio.options.headers.remove("Authorization");
    }
  }

  Future<bool> _checkInternetConnection() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   return false;
    // }
    return true;
  }
}
