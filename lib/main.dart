import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news/product/navigator/app_router.dart';

part 'product/init/main_init.dart';

void main() {
  initInitializes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
