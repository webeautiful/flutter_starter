import 'package:dio/dio.dart';

class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['XX-Token'] = '';
    options.headers['XX-Device-Type'] = '';
    options.headers['XX-Api-Version'] = '2.0.1';
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}

class HttpUtil {
  const HttpUtil();
}