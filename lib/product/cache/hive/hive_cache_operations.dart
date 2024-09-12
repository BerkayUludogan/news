import 'package:hive/hive.dart';
import 'package:news/product/cache/core/index.dart';
import 'package:news/product/cache/core/model/cache_model.dart';

part '../core/mixin/cache_manager_mixin.dart';

class HiveCacheOperations<T extends CacheModel> extends CacheOperations<T>
    with CacheManagerMixin<T> {
  @override
  void add(T item) {
    _box?.put(item.cacheId, item);
  }

  @override
  void addAll(List<T> items) {
    final map = <String, T>{
      for (final item in items) item.cacheId: item,
    };
    _box?.putAll(map);
  }

  @override
  T? get(String id) => _box?.get(id);

  @override
  List<T> getAll() {
    return _box?.values.cast<T>().toList() ?? [];
  }

  @override
  void remove(String id) {
    _box?.delete(id);
  }

  @override
  void update(T item) {
    _box?.put(item.cacheId, item);
  }
}
