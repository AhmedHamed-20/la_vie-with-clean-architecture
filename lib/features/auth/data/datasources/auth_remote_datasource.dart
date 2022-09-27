import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/models/auth_model.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/models/user_data_model.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/get_userdata_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/signUp_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> login(LoginParams loginParams);
  Future<AuthModel> signUp(SignUpParams signUpParams);
  Future<UserDataModel> getUserData(UserDataParams userDataParams);
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

  @override
  Future<UserDataModel> getUserData(UserDataParams userDataParams) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.getMe,
        headers: {
          'Authorization': 'Bearer ${userDataParams.accessToken}',
          'Content-Type': 'application/json',
        },
      );

      return UserDataModel.fromJson(response?.data['data']);
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }
}
