import 'package:dio/dio.dart';

import '../../../../../error/error_message_model.dart';
import '../../../../../error/exceptions.dart';
import '../../../../../network/dio.dart';
import '../../../../../network/endpoints.dart';
import '../../domain/usecases/get_userdata_usecase.dart';
import '../models/user_data_model.dart';

abstract class BaseMainLayoutRemoteDataSource {
  Future<UserDataModel> getUserData(UserDataParams userDataParams);
}

class MainLayoutRemoteDataSourceImpl extends BaseMainLayoutRemoteDataSource {
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
