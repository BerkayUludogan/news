import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/home/mixin/home_view_mixin.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/view/home_search_delegate.dart';
import 'package:news/feature/home/view_model/home_view_model.dart';
import 'package:news/feature/home/widget/home_card.dart';
import 'package:news/feature/home/widget/home_listview.dart';
import 'package:news/product/constant/color/const_color.dart';
import 'package:news/product/constant/strings/const_string.dart';

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
      /*   appBar: HomeAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              icon: const Icon(Icons.search),
              color: ConstColor.white,
              onPressed: () => showSearch(
                context: context,
                delegate: HomeSearchDelegate(
                  newsList: homeViewModel.newsList,
                ),
              ),
            ),
          ),
        ],
      ), */
      body: _body(),
    );
  }

  Widget _body() {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
          return !state.loading && mounted
              ? state.newsList != null
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          title: const Text(
                            ConstantStrings.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          centerTitle: true,
                          backgroundColor: Colors.red,
                          iconTheme: const IconThemeData(
                            color: ConstColor.white,
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: IconButton(
                                icon: const Icon(Icons.search),
                                color: ConstColor.white,
                                onPressed: () => showSearch(
                                  context: context,
                                  delegate: HomeSearchDelegate(
                                    state: state,
                                    newsList: homeViewModel.newsList,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: FirstListView(state: state),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return HomeCard(
                                state: state,
                                index: index,
                              );
                            },
                            childCount: 20,
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text(ConstantStrings.noNews),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
