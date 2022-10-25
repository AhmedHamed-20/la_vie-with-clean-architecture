import 'package:dio/dio.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_comment_usecase.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/add_like.dart';
import 'package:la_vie_with_clean_architecture/features/forums/domain/usecases/search_in_forums_by_name.dart';

import '../../../../core/error/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/usecases/get_all_forums.dart';
import '../../domain/usecases/get_forums_me.dart';
import '../../domain/usecases/post_new_forums.dart';
import '../models/all_forums_model.dart';
import '../models/forums_me_model.dart';

abstract class BaseForumsRemoteDatesource {
  Future<List<AllForumsModel>> getAllForums(AllForumsParams params);
  Future<List<ForumsMeModel>> getForumsMe(ForumsMeParams params);
  Future<void> postForum(ForumsPostParams params);
  Future<dynamic> addLikeToPost(LikesAddParams params);
  Future<dynamic> addCommentToPost(CommentsAddingParams params);
  Future<List<AllForumsModel>> searchForumByTitle(
      ForumsSearchByTitleParams params);
}

class AllForumsRemoteDatasource extends BaseForumsRemoteDatesource {
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

  @override
  Future<List<ForumsMeModel>> getForumsMe(ForumsMeParams params) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.getMeForums,
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );

      return List<ForumsMeModel>.from((response?.data['data'] as List).map(
        (e) => ForumsMeModel.fromJson(e),
      ));
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
        error.response?.data,
      ));
    }
  }

  @override
  Future<void> postForum(ForumsPostParams params) async {
    try {
      await DioHelper.postData(
        url: EndPoints.createPost,
        data: {
          "title": params.title,
          "description": params.description,
          "imageBase64": params.imageBae64,
        },
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );
    } on DioError catch (error) {
      throw ServerException(errorMessageModel: error.response?.data);
    }
  }

  @override
  Future addLikeToPost(LikesAddParams params) async {
    try {
      final response = await DioHelper.postData(
        url: EndPoints.addLike(params.forumId),
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );

      return response;
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }

  @override
  Future addCommentToPost(CommentsAddingParams params) async {
    try {
      await DioHelper.postData(
        url: EndPoints.addComment(params.forumId),
        data: {"comment": params.comment},
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );
    } on DioError catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(error.response?.data));
    }
  }

  @override
  Future<List<AllForumsModel>> searchForumByTitle(
      ForumsSearchByTitleParams params) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.forumsSearch(params.forumTitle),
        headers: {
          'Authorization': 'Bearer ${params.accessToken}',
          'Content-Type': 'application/json',
        },
      );
      return List<AllForumsModel>.from(
        (response?.data['data'] as List).map((e) => AllForumsModel.fromJson(e)),
      );
    } on DioError catch (error) {
      throw ServerException(errorMessageModel: error.response?.data);
    }
  }
}
