import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/home/mixin/home_view_mixin.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/view_model/home_view_model.dart';
import 'package:news/feature/home/widget/home_app_bar.dart';
import 'package:news/feature/home/widget/home_listview.dart';
import 'package:news/product/service/model/news.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const HomeAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: _body(),
    );
  }

  BlocProvider<HomeViewModel> _body() {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
          return !state.loading && mounted
              ? state.newsList != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.7,
                          child: FirstListView(state: state),
                        ),
                        SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: const Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text('Haber Yok'),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  int _timeCalculation(News news) {
    // final hoursAgo = _timeCalculation(news);

    final timestamp = news.datetime!;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      timestamp * 1000,
    );
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final hoursAgo = difference.inHours;
    return hoursAgo;
  }
}
