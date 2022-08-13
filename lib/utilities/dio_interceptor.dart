import 'package:dio/dio.dart';

import 'logger_service.dart';

class DioInterceptor implements Interceptor {
  final _log = LoggerService("DioInterceptor");

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _log.log('ENDPOINT: ' + err.requestOptions.uri.toString());
    _log.log('STATUSCODE: ' + err.error.toString());
    _log.log('MESSAGE: ' + (err.response?.data ?? err.message).toString());
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.log('METHOD: ' + options.method);
    _log.log('ENDPOINT: ' + options.uri.toString());
    _log.log('HEADERS: ' + options.headers.toString());
    _log.log('DATA: ' + (options.data ?? options.queryParameters).toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log.log('ENDPOINT: ' + response.requestOptions.uri.toString());
    _log.log('STATUSCODE: ' + response.statusCode.toString());
    _log.log('DATA: ' + response.data.toString());
    handler.next(response);
  }
}
