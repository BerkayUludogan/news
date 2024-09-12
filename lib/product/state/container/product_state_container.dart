import 'package:get_it/get_it.dart';
import 'package:news/product/cache/hive/hive_cache_manager.dart';
import 'package:news/product/cache/product_cache.dart';
import 'package:news/product/navigator/app_router.dart';

final class ProductStateContainer {
  ProductStateContainer._();
  static final _getIt = GetIt.instance;
  static final router = _getIt<AppRouter>();

  static void setup() {
    _getIt
      ..registerSingleton<ProductCache>(
        ProductCache(cacheManager: HiveCacheManager()),
      )
      ..registerSingleton<AppRouter>(
        AppRouter(),
      );
  }

  static T read<T extends Object>() {
    return _getIt<T>();
  }
}
