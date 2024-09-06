import 'package:flutter/widgets.dart';
import 'package:news/feature/home/view/home_view.dart';
import 'package:news/feature/home/view_model/home_view_model.dart';

mixin HomeViewMixin on State<HomeView> {
  HomeViewModel get homeViewModel => _homeViewModel;
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel();
    _homeViewModel.fetchNews();
  }
}
