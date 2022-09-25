import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/auth/data/models/auth_model.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/signUp_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> login(LoginParams loginParams);
  Future<AuthModel> signUp(SignUpParams signUpParams);
}

class RemoteAuthDataSourceImpl extends BaseAuthRemoteDataSource {
  @override
  Future<AuthModel> login(LoginParams loginParams) async {
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

    if (response?.statusCode == 200) {
      return AuthModel.fromJson(response?.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response?.data,
        ),
      );
    }
  }

  @override
  Future<AuthModel> signUp(SignUpParams signUpParams) async {
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

    if (response?.statusCode == 200) {
      return AuthModel.fromJson(response?.data['data']);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          response?.data,
        ),
      );
    }
  }
}
