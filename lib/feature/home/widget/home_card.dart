import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/widget/index.dart';
import 'package:news/product/navigator/app_router.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.index,
    required this.state,
    super.key,
  });
  final HomeState state;
  final int index;
  @override
  Widget build(BuildContext context) {
    final news = state.newsList![index + 3];

    return InkWell(
      onTap: () =>
          context.pushRoute(HomeDetailRoute(state: state, index: index + 3)),
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CustomImage(imageUrl: news.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                textAlign: TextAlign.center,
                news.headline.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
