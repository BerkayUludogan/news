part of '../../hive/hive_cache_operations.dart';

/// Hive Box open
mixin CacheManagerMixin<T> {
  Box<T>? _box;

  Future<void> open() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<T>(T.toString());
    }
  }

  Future<void> clear() => _box!.clear();
}
