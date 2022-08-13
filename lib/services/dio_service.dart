import 'package:dio/dio.dart';

import '../models/api_response.dart';
import '../utilities/api_util.dart';
import '../utilities/app_strings.dart';
import '../utilities/dio_interceptor.dart';
import '../utilities/logger_service.dart';

class DioService {
  final _dio = Dio();
  final _log = LoggerService("DioService");

  DioService([String? baseUrl]) {
    _dio.interceptors.add(DioInterceptor());
    _dio.options.sendTimeout = 60000;
    _dio.options.receiveTimeout = 60000;
    _dio.options.baseUrl = baseUrl ?? AppStrings.baseURL;
  }

  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    _log.log('Making request to $path');
    try {
      final response = await _dio.get(
        path.toString(),
        queryParameters: queryParameters,
        options: Options(headers: {'Authorization': token}),
      );

      _log.log('Response from $path \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      _log.log(e.toString());
      return ApiResponse(
        error: true,
        data: e.response?.data,
        statusMessage: e.response?.data['message'],
      );
    }
  }

  Future<ApiResponse> post(
    String path, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    _log.log('Making request to $path');
    try {
      final response = await _dio.post(path,
          data: body, options: Options(headers: {'Authorization': token}));

      _log.log('Response from $path \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      _log.log(e.toString());
      return ApiResponse(
        error: true,
        data: e.response?.data,
        statusMessage: e.response?.data['message'],
      );
    }
  }

  Future<ApiResponse> uploadImage({
    required String path,
    required FormData formData,
    required String token,
  }) async {
    try {
      final response = await _dio.post(
        path,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'multipart/form-data',
          },
        ),
        data: formData,
      );
      _log.log(response.data);
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      _log.log(e.toString());
      return ApiResponse(
        error: true,
        data: e.response?.data,
        statusMessage: e.response?.data['message'],
      );
    }
  }

  Future<ApiResponse> put(
    String path, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    _log.log('Making request to $path');
    try {
      final response = await _dio.put(path.toString(),
          data: body, options: Options(headers: {'Authorization': token}));

      _log.log('Response from $path \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      _log.log(e.toString());
      return ApiResponse(
        error: true,
        data: e.response?.data,
        statusMessage: e.response?.data['message'],
      );
    }
  }

  Future<ApiResponse> patch(String path,
      {Map<String, dynamic>? body, String? token}) async {
    _log.log('Making request to $path');
    try {
      final response = await _dio.patch(path,
          data: body, options: Options(headers: {'Authorization': token}));
      _log.log('Response from $path \n${response.data}');

      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      _log.log(e.toString());
      return ApiResponse(
        error: true,
        data: e.response?.data,
        statusMessage: e.response?.data['message'],
      );
    }
  }

  Future<ApiResponse> delete(String path,
      {Map<String, dynamic>? body, String? token}) async {
    _log.log('Making request to $path');
    try {
      final response = await _dio.delete(
        path,
        data: body,
        options: Options(headers: {'Authorization': token}),
      );

      _log.log('Response from $path \n${response.data}');
      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      _log.log(e.toString());
      return ApiResponse(
        error: true,
        data: e.response?.data,
        statusMessage: e.response?.data['message'],
      );
    }
  }
}
