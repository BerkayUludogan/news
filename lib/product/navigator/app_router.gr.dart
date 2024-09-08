// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeDetailView(
          state: args.state,
          index: args.index,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
  };
}

/// generated route for
/// [HomeDetailView]
class HomeDetailRoute extends PageRouteInfo<HomeDetailRouteArgs> {
  HomeDetailRoute({
    News? news,
    HomeState? state,
    required int index,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeDetailRoute.name,
          args: HomeDetailRouteArgs(
            state: state,
            index: index,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailRoute';

  static const PageInfo<HomeDetailRouteArgs> page =
      PageInfo<HomeDetailRouteArgs>(name);
}

class HomeDetailRouteArgs {
  const HomeDetailRouteArgs({
    this.news,
    this.state,
    required this.index,
    this.key,
  });
  final News? news;

  final HomeState? state;

  final int index;

  final Key? key;

  @override
  String toString() {
    return 'HomeDetailRouteArgs{state: $state, index: $index, key: $key}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
