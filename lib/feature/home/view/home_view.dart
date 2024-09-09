import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:news/feature/home/mixin/home_view_mixin.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/view/home_search_delegate.dart';
import 'package:news/feature/home/view_model/home_view_model.dart';
import 'package:news/product/constant/color/const_color.dart';
import 'package:news/product/constant/strings/const_string.dart';
import 'package:news/product/service/model/news.dart';

import '../widget/index.dart';

part '../widget/home_custom_scroll_view.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

HomeState state = const HomeState(loading: false);

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _body(),
    );
  }

  Widget _body() {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
          if (!state.loading && mounted) {
            return state.newsList != null
                ? HomeCustomScrollView(
                    state: state,
                    newsList: homeViewModel.newsList,
                  )
                : const Center(
                    child: Text(ConstantStrings.noNews),
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
