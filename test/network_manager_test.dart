import 'package:flutter_test/flutter_test.dart';
import 'package:news/product/service/manager/product_network_manager.dart';
import 'package:news/product/service/model/news.dart';
import 'package:news/product/service/product_service_path.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    manager = ProductNetworkManager.base();
  });
  test('get news items from api', () async {
    final response = await manager.send<News, List<News>>(
      ProductServicePath.news.value,
      parseModel: News(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
  });
}
