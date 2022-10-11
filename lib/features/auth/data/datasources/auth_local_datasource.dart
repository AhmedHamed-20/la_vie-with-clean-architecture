import 'package:la_vie_with_clean_architecture/core/cache/cache_helper.dart';
import 'package:la_vie_with_clean_architecture/core/error/error_message_model.dart';
import 'package:la_vie_with_clean_architecture/core/error/exceptions.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/usecases/cache_access_token.dart';

abstract class BaseAuthLocalDataSource {
  Future<bool> cacheAccessToken(AccessTokenCacheParams params);
}

class AuthLocalDataSourceImpl extends BaseAuthLocalDataSource {
  @override
  Future<bool> cacheAccessToken(AccessTokenCacheParams params) async {
    try {
      final result = await CacheHelper.setData(
          key: 'accessToken', value: params.accessToken);

      return result;
    } on Exception catch (e) {
      throw CacheException(
        LocalErrorsMessageModel(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
