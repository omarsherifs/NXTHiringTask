class ServerException implements Exception {
  ServerException({
    required this.statusCode,
    required this.message,
  });
  int statusCode;
  String message;
}
