import 'package:news/product/cache/core/model/cache_model.dart';

abstract class CacheOperations<T extends CacheModel> {
  void add(T item);
  void addAll(List<T> items);
  void update(T item);
  void remove(String id);

  List<T> getAll();
  T? get(String id);
}
