import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  final String type;

  const ErrorMessageModel({required this.message, required this.type});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(message: json['message'], type: json['type']);
  }
  @override
  List<Object?> get props => [message, type];
}

class DataBaseErrorMessageModel extends Equatable {
  final String errorMessage;

  const DataBaseErrorMessageModel({required this.errorMessage});

  factory DataBaseErrorMessageModel.fromException(Object? error) {
    return DataBaseErrorMessageModel(errorMessage: error.toString());
  }
  @override
  List<Object?> get props => [errorMessage];
}
