import 'package:dio/dio.dart';
import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../../domain/usecases/get_userdata_usecase.dart';
import '../models/get_all_products_model.dart';
import '../models/user_data_model.dart';

abstract class BaseAllProductsRemoteDataSource {
  Future<List<AllProductsModel>> getAllProducts(AllproudctsParams params);
  Future<UserDataModel> getUserData(UserDataParams userDataParams);
}

class AllProductRemoteDataSourceImpl extends BaseAllProductsRemoteDataSource {
  @override
  Future<List<AllProductsModel>> getAllProducts(
      AllproudctsParams params) async {
    try {
      final response =
          await DioHelper.getData(url: EndPoints.getAllProducst, headers: {
        'Authorization': 'Bearer ${params.accessToken}',
        'Content-Type': 'application/json',
      });

      return List<AllProductsModel>.from((response?.data['data'] as List).map(
        (e) => AllProductsModel.fromJson(e),
      ));
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
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
      print(error.response);
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }
}
