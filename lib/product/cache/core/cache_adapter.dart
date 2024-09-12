import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:news/product/cache/core/model/cache_model.dart';
import 'package:news/product/cache/hive/hive_adapter_id.dart';

class CacheAdapter<T extends CacheModel> extends TypeAdapter<T> {
  CacheAdapter({
    required this.hiveAdapterId,
    required this.fromJson,
  });
  HiveAdapterId hiveAdapterId;
  T Function(Map<String, dynamic>) fromJson;
  @override
  T read(BinaryReader reader) {
    final read = reader.readByte();
    final jsonConverted = jsonEncode(read);
    return fromJson(
      json.decode(jsonConverted) as Map<String, dynamic>,
    );
  }

  @override
  void write(BinaryWriter writer, T obj) {
    writer.write(obj.toJson());
  }

  @override
  int get typeId => hiveAdapterId.value;
}
