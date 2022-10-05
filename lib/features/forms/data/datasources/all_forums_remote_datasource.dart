import 'package:dio/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/dio.dart';
import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/forms/data/models/all_forums_model.dart';
import 'package:la_vie_with_clean_architecture/features/forms/domain/usecases/get_all_forums.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class BaseAllForumsRemoteDatesource {
  Future<List<AllForumsModel>> getAllForums(AllForumsParams params);
}

class AllForumsRemoteDatasource extends BaseAllForumsRemoteDatesource {
  @override
  Future<List<AllForumsModel>> getAllForums(AllForumsParams params) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.getAllForums,
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );
      return List<AllForumsModel>.from((response?.data['data'] as List).map(
        (e) => AllForumsModel.fromJson(e),
      ));
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }
}
