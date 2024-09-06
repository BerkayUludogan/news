import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/home/state/home_state.dart';
import 'package:news/product/service/manager/product_network_manager.dart';
import 'package:news/product/service/model/news.dart';
import 'package:news/product/service/product_service_path.dart';
import 'package:vexana/vexana.dart';

final class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(const HomeState(loading: false));

  List<News>? newsList;

  Future<void> fetchNews() async {
    emit(state.copyWith(loading: true));

    final manager = ProductNetworkManager.base();
    final response = await manager.send<News, List<News>>(
      ProductServicePath.news.value,
      parseModel: News(),
      method: RequestType.GET,
    );
    newsList = response.data;
    emit(state.copyWith(newsList: newsList));
  }
}
