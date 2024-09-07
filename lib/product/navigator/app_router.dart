import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/view/home_detail_view.dart';
import 'package:news/feature/home/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          page: HomeRoute.page,
          path: '/',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: HomeDetailRoute.page,
          path: '/homeDetailRoute',
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 400,
        ),
      ];
}
