import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final int type;

  const ErrorMessageModel({required this.message, required this.type});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        message: json['message'], type: json['statusCode']);
  }
  @override
  List<Object?> get props => [message, type];
}

class LocalErrorsMessageModel extends Equatable {
  final String errorMessage;

  const LocalErrorsMessageModel({required this.errorMessage});

  factory LocalErrorsMessageModel.fromException(Object? error) {
    return LocalErrorsMessageModel(errorMessage: error.toString());
  }
  @override
  List<Object?> get props => [errorMessage];
}
