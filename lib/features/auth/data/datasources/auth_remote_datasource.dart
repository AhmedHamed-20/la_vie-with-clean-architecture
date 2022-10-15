import 'package:dio/dio.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signUp_usecase.dart';
import '../models/auth_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> login(LoginParams loginParams);
  Future<AuthModel> signUp(SignUpParams signUpParams);
}

class RemoteAuthDataSourceImpl extends BaseAuthRemoteDataSource {
  @override
  Future<AuthModel> login(LoginParams loginParams) async {
    try {
      final response = await DioHelper.postData(
        url: EndPoints.signIn,
        headers: {
          'Content-Type': 'application/json',
        },
        data: {
          'email': loginParams.email,
          'password': loginParams.password,
        },
      );

      return AuthModel.fromJson(response?.data['data']);
    } on DioError catch (error) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          error.response?.data,
        ),
      );
    }
  }

  @override
  Future<AuthModel> signUp(SignUpParams signUpParams) async {
    try {
      final response = await DioHelper.postData(
        url: EndPoints.signUp,
        headers: {
          'Content-Type': 'application/json',
        },
        data: {
          'firstName': signUpParams.firstName,
          'lastName': signUpParams.lastName,
          'email': signUpParams.email,
          'password': signUpParams.password,
        },
      );
      return AuthModel.fromJson(response?.data['data']);
    } on DioError catch (error) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          error.response?.data,
        ),
      );
    }
  }
}
