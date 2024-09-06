import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/feature/home/view/home_detail_view.dart';
import 'package:news/feature/home/widget/home_custom_container.dart';
import 'package:news/product/constant/color/const_color.dart';
import 'package:news/product/constant/strings/const_string.dart';
import 'package:news/product/service/model/news.dart';

class FirstListView extends StatelessWidget {
  const FirstListView({required this.state, super.key});
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        final news = state.newsList![index];
        final hoursAgo = _timeCalculation(news);
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeDetailView(
                state: state,
                index: index, // Index'i parametre olarak gönderin
              ),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: HomeCustomContainer(
                  width: 360,
                  color: ConstColor.white,
                  child: news.image != ''
                      ? Image.network(
                          news.image.toString(),
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          ConstantStrings.image,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                left: 8,
                child: HomeCustomContainer(
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
                  // onTap: () => print('$index'),
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
