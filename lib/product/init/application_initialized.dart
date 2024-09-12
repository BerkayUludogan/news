import 'package:flutter/widgets.dart';
import 'package:news/product/state/container/product_state_container.dart';
import 'package:news/product/state/container/product_state_items.dart';

final class ApplicationInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _hive();
  }

  Future<void> _hive() async {
    ProductStateContainer.setup();

    final productCache = ProductStateItems.productCacheManager;

    await productCache.init();
    productCache.register();
    await productCache.newsHiveCacheOperation.open();
  }
}
