import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends INetworkModel<News> with EquatableMixin {
  News({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  String? category;
  int? datetime;
  String? headline;
  int? id;
  String? image;
  String? related;
  String? source;
  String? summary;
  String? url;

  @override
  News fromJson(Map<String, dynamic> json) => News.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$NewsToJson(this);

  @override
  List<Object?> get props =>
      [category, datetime, headline, id, image, related, source, summary, url];

  News copyWith({
    String? category,
    int? datetime,
    String? headline,
    int? id,
    String? image,
    String? related,
    String? source,
    String? summary,
    String? url,
  }) {
    return News(
      category: category ?? this.category,
      datetime: datetime ?? this.datetime,
      headline: headline ?? this.headline,
      id: id ?? this.id,
      image: image ?? this.image,
      related: related ?? this.related,
      source: source ?? this.source,
      summary: summary ?? this.summary,
      url: url ?? this.url,
    );
  }
}
