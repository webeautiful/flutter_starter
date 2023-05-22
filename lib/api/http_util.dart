import 'package:dio/dio.dart';
import 'package:flutter_starter/api/api_exception.dart';
import 'package:flutter_starter/models/api_response_entity.dart';

class NetworkConfig {
  static const String baseUrl = 'https://api.bidacoin.co';
  static const Duration connectTimeOut = Duration(seconds: 10);
  static const Duration receiveTimeOut = Duration(seconds: 10);
  static const Duration sendTimeOut = Duration(seconds: 10);
  static const int responseSuccessCode = 1;
}

enum MethodType { get, post }

extension MethodTypeExtension on MethodType {
  String get value {
    switch (this) {
      case MethodType.get:
        return 'get';
      case MethodType.post:
        return 'post';
    }
  }
}

class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['XX-Token'] = '';
    options.headers['XX-Device-Type'] = '';
    options.headers['XX-Api-Version'] = '2.0.1';
    super.onRequest(options, handler);
  }
}

final httpUtil = Http();

class Http {
  static final Http _instance = Http._internal();
  static late final Dio _dio;

  factory Http() {
    BaseOptions options = BaseOptions(
      baseUrl: NetworkConfig.baseUrl,
      connectTimeout: NetworkConfig.connectTimeOut,
      receiveTimeout: NetworkConfig.receiveTimeOut,
      sendTimeout: NetworkConfig.sendTimeOut,
    );
    _dio = Dio(options);
    _dio.interceptors.add(HttpInterceptor());
    return _instance;
  }

  Http._internal();

  Future<ApiResponseEntity<T>?> _request<T>(
    String path, {
    required MethodType method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
    Function(ApiException)? onError, //用于错误信息处理的回调
  }) async {
    try {
      Options options = Options()
        ..method = method.value
        ..headers = headers;

      Response response = await _dio.request(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      return _handleResponse<T>(response);
    } catch (e) {
      ///创建 ApiException ，调用 onError，当 onError 返回为 true 时即错误信息已被调用方处理，则不抛出异常，否则抛出异常。
      var exception = ApiException.from(e);

      if (handleException(exception) == false) {
        if (onError != null) {
          onError.call(exception);
        } else {
          // TODO: 使用默认方式处理异常
          // SenetToast.fail(exception.msg ?? ApiException.unknownException);
        }
      }
      return null;
    }
  }

  ///请求响应内容处理
  ApiResponseEntity<T> _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      ApiResponseEntity<T> apiResponse =
          ApiResponseEntity<T>.fromJson(response.data);
      return _handleBusinessResponse<T>(apiResponse);
    } else {
      var exception =
          ApiException(response.statusCode, ApiException.unknownException);
      throw exception;
    }
  }

  ///业务内容处理
  ApiResponseEntity<T> _handleBusinessResponse<T>(
      ApiResponseEntity<T> response) {
    if (response.code == NetworkConfig.responseSuccessCode) {
      return response;
    } else {
      var exception = ApiException(response.code, response.msg);
      throw exception;
    }
  }

  Future<ApiResponseEntity<T>?> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Function(ApiException)? onError,
  }) {
    return _request(path,
        method: MethodType.get,
        queryParameters: queryParameters,
        headers: headers,
        onError: onError);
  }

  Future<ApiResponseEntity<T>?> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    Function(ApiException)? onError,
  }) {
    return _request(path,
        method: MethodType.post,
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }
}
