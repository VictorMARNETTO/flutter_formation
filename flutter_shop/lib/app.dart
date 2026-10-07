import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/list_product_page.dart';
import 'package:flutter_shop/router.dart';

class FlutterShopApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: router,
      // home: ListProductPage(),
    );
  }
}
