import 'package:dio/dio.dart';

import '../models/api_response.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.statusCode,
      statusMessage: res.statusMessage,
      data: res.data,
    );
  }

  static bool validated(ApiResponse response) =>
      response.statusCode == 200 || response.statusCode == 201;
}
