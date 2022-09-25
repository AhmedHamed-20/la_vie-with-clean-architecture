import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/data/models/get_all_products_model.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/usecases/get_all_products_usecase.dart';

abstract class BaseAllProductsRemoteDataSource {
  Future<List<AllProductsModel>> getAllProducts(AllproudctsParams params);
}

class AllProductRemoteDataSourceImpl extends BaseAllProductsRemoteDataSource {
  @override
  Future<List<AllProductsModel>> getAllProducts(
      AllproudctsParams params) async {
    final response =
        await DioHelper.getData(url: EndPoints.getAllProducst, headers: {
      'Authorization': 'Bearer ${params.accessToken}',
      'Content-Type': 'application/json',
    });

    if (response?.statusCode == 200) {
      return List<AllProductsModel>.from((response?.data['data'] as List).map(
        (e) => AllProductsModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response?.data));
    }
  }
}
