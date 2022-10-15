import '../../../../../cache/cache_helper.dart';
import '../../../../../error/error_message_model.dart';
import '../../../../../error/exceptions.dart';
import '../../domain/usecases/get_access_token_from_cache.dart';

abstract class BaseMainLayoutLocalDataSource {
  Future<dynamic> getAccessTokenFromCache(AccessTokenFromCacheParams params);
}

class MainLayoutLocalDataSourceImpl extends BaseMainLayoutLocalDataSource {
  @override
  Future getAccessTokenFromCache(AccessTokenFromCacheParams params) async {
    try {
      final result = await CacheHelper.getData(key: params.key);
      return result;
    } on Exception catch (e) {
      throw CacheException(LocalErrorsMessageModel(errorMessage: e.toString()));
    }
  }
}
