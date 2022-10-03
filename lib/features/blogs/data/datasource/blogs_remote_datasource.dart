import 'package:dio/dio.dart';
import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/data/models/get_blogs_model.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/usecases/get_blogs_usecase.dart';

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
