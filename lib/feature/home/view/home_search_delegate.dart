// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/widget/index.dart';
import 'package:news/product/constant/strings/const_string.dart';
import 'package:news/product/navigator/app_router.dart';
import 'package:news/product/service/model/news.dart';

class HomeSearchDelegate extends SearchDelegate<News?> {
  HomeSearchDelegate({
    required this.state,
    required this.newsList,
  });
  List<News>? newsList;
  HomeState state;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = newsList!
        .where(
          (element) =>
              element.headline?.toLowerCase().contains(query.toLowerCase()) ??
              false,
        )
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final news = suggestionList[index];
        return Card(
          child: ListTile(
            title: Text(news.headline ?? ConstantStrings.noHeadline),
            leading: CircleAvatar(
              child: CustomImage(imageUrl: news.image),
            ),
            onTap: () {
              context.pushRoute(HomeDetailRoute(state: state, index: index));
            },
          ),
        );
      },
    );
  }
}
