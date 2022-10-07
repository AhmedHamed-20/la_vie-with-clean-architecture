import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class CacheException implements Exception {}

class AppDataBaseException implements Exception {
  final DataBaseErrorMessageModel dataBaseErrorMessageModel;

  const AppDataBaseException(this.dataBaseErrorMessageModel);
}
