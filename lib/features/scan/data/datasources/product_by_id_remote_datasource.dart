import 'package:dio/dio.dart';
import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/scan/data/models/product_by_id_model.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/usecases/get_product_by_id.dart';

abstract class BaseProductByIdRemoteDataSource {
  Future<ProductByIdModel> getProductById(ProductByIdParams params);
}

class ProductByIdRemoteDataSourceImpl extends BaseProductByIdRemoteDataSource {
  @override
  Future<ProductByIdModel> getProductById(ProductByIdParams params) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.getProductById(params.productId),
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );
      return ProductByIdModel.fromJson(response?.data['data']);
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }
}
