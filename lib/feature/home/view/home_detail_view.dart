import 'package:flutter/material.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/product/constant/strings/const_string.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('News'),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              news.headline.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Divider(),
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
    );
  }
}
