import 'package:news/product/cache/core/model/cache_model.dart';
import 'package:news/product/cache/hive/hive_adapter_id.dart';

abstract class CacheManager {
  CacheManager({this.path});

  Future<void> init();
  void register<T extends CacheModel<T>>({
    required T model,
    required HiveAdapterId hiveAdapterId,
  });
  final String? path;
}
