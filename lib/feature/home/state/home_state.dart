import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news/product/service/model/news.dart';

@immutable
final class HomeState extends Equatable {
  const HomeState({required this.loading, this.newsList});

  final bool loading;
  final List<News>? newsList;
  @override
  List<Object?> get props => [newsList];

  HomeState copyWith({bool loading = false, List<News>? newsList}) {
    return HomeState(
      newsList: newsList ?? this.newsList,
      loading: loading,
    );
  }
}
