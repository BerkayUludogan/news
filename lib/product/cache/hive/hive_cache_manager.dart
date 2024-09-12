import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/product/cache/core/index.dart';
import 'package:news/product/cache/core/model/cache_model.dart';
import 'package:news/product/cache/hive/hive_adapter_id.dart';
import 'package:path_provider/path_provider.dart';

final class HiveCacheManager extends CacheManager {
  HiveCacheManager({super.path});
  @override
  Future<void> init() async {
    final documentPath =
        path ?? (await getApplicationDocumentsDirectory()).path;
    await Hive.initFlutter(documentPath);
  }

  @override
  void register<T extends CacheModel<T>>({
    required T model,
    required HiveAdapterId hiveAdapterId,
  }) {
    Hive.registerAdapter<T>(
      CacheAdapter<T>(
        hiveAdapterId: hiveAdapterId,
        fromJson: model.fromJson,
      ),
    );
  }
}
