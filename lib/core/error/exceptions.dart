import 'error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class CacheException implements Exception {
  final LocalErrorsMessageModel localErrorsMessageModel;

  CacheException(this.localErrorsMessageModel);
}

class AppDataBaseException implements Exception {
  final LocalErrorsMessageModel dataBaseErrorMessageModel;

  const AppDataBaseException(this.dataBaseErrorMessageModel);
}
