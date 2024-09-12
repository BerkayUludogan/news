import 'package:news/product/cache/core/cache_manager.dart';
import 'package:news/product/cache/hive/hive_adapter_id.dart';
import 'package:news/product/cache/hive/hive_cache_operations.dart';
import 'package:news/product/service/model/news.dart';

final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init();
  }

  void register() {
    _cacheManager.register(model: News(), hiveAdapterId: HiveAdapterId.news);
  }

  late final HiveCacheOperations<News> newsHiveCacheOperation =
      HiveCacheOperations<News>();
}
