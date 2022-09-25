import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class CacheException implements Exception {}
