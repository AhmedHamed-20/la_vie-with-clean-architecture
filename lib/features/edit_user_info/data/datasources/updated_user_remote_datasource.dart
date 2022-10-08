import 'package:dio/dio.dart';
import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/data/models/updated_user_data_model.dart';
import 'package:la_vie_with_clean_architecture/features/edit_user_info/domain/usecases/update_user_data.dart';

abstract class BaseUpdatedUserRemoteDatasource {
  Future<UpdatedUserDataModel> updateUserData(UpdatedUserDataParams params);
}

class UpdatedUserDataRemoteDataSourceImpl
    extends BaseUpdatedUserRemoteDatasource {
  @override
  Future<UpdatedUserDataModel> updateUserData(
      UpdatedUserDataParams params) async {
    try {
      final updatedUserMap = UpdatedUserDataModel.toJson(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        address: params.address,
      );
      final response = await DioHelper.patchData(
        url: EndPoints.updateMyData,
        data: updatedUserMap,
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );

      return UpdatedUserDataModel.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(error.response?.data),
      );
    }
  }
}
