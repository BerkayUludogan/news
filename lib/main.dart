import 'package:flutter/material.dart';
import 'package:news/product/init/application_initialized.dart';
import 'package:news/product/state/container/product_state_container.dart';

void main() async {
  await ApplicationInitialize().make();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ProductStateContainer.router.config(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
