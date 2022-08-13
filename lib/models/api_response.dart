class ApiResponse {
  final int? statusCode;
  final dynamic statusMessage;
  final dynamic data;
  final bool error;

  ApiResponse(
      {this.statusCode, this.statusMessage, this.data, this.error = false});

  @override
  String toString() {
    return '$data';
  }
}
