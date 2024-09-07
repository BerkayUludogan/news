import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/widget/home_app_bar.dart';
import 'package:news/product/constant/strings/const_string.dart';
import 'package:news/product/service/model/news.dart';

@RoutePage()
class HomeDetailView extends StatelessWidget {
  const HomeDetailView({
    required this.state,
    required this.index,
    super.key,
  });
  final HomeState state;
  final int index;
  @override
  Widget build(BuildContext context) {
    final news = state.newsList![index];
    final hoursAgo = _timeCalculation(news);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                news.headline.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Text('$hoursAgo hours ago'),
              ),
              const SizedBox(
                height: 20,
              ),
              if (news.image != '')
                Image.network(news.image.toString())
              else
                Image.asset(ConstantStrings.image),
              const SizedBox(
                height: 20,
              ),
              Text(
                news.summary.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _timeCalculation(News news) {
    final timestamp = news.datetime;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      timestamp! * 1000,
    );
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final hoursAgo = difference.inHours;
    return hoursAgo;
  }
}
