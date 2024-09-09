import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/widget/index.dart';
import 'package:news/product/constant/color/const_color.dart';
import 'package:news/product/navigator/app_router.dart';
import 'package:news/product/widget/custom_container.dart';

class FirstListView extends StatelessWidget {
  const FirstListView({required this.state, super.key});
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        final news = state.newsList![index];

        return InkWell(
          onTap: () =>
              context.pushRoute(HomeDetailRoute(state: state, index: index)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomContainer(
                  width: 360,
                  color: ConstColor.white,
                  child: CustomImage(imageUrl: news.image),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                left: 8,
                child: CustomContainer(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ConstColor.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: Text(
                  news.headline.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
