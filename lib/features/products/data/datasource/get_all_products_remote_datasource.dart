import 'package:dio/dio.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../models/get_all_products_model.dart';

abstract class BaseAllProductsRemoteDataSource {
  Future<List<AllProductsModel>> getAllProducts(AllproudctsParams params);
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
}
