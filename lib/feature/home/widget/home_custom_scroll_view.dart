part of '../view/home_view.dart';

class HomeCustomScrollView extends StatelessWidget {
  const HomeCustomScrollView({
    required this.state,
    required this.newsList,
    super.key,
  });
  final HomeState state;
  final List<News>? newsList;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            ConstantStrings.title,
            style: TextStyle(color: ConstColor.white),
          ),
          centerTitle: true,
          backgroundColor: ConstColor.red,
          iconTheme: const IconThemeData(
            color: ConstColor.white,
          ),
          actions: [
            Padding(
              padding: context.padding.low,
              child: IconButton(
                icon: const Icon(Icons.search),
                color: ConstColor.white,
                onPressed: () => showSearch(
                  context: context,
                  delegate: HomeSearchDelegate(
                    state: state,
                    newsList: newsList,
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
    );
  }
}
