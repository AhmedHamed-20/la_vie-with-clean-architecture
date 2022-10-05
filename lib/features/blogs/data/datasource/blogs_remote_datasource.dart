import 'package:dio/dio.dart';
import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio.dart';
import '../../../../core/network/endpoints.dart';
import '../models/get_blogs_model.dart';
import '../../domain/usecases/get_blogs_usecase.dart';

abstract class BaseBlogsRemoteDataSource {
  Future<BlogsModel> getBLogs(BlogsParams params);
}

class BlogsRemoteDataSourceImpl extends BaseBlogsRemoteDataSource {
  @override
  Future<BlogsModel> getBLogs(BlogsParams params) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.blogs,
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );
      return BlogsModel.fromJson(response?.data['data']);
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }
}
