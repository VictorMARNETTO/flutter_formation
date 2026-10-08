import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/router.dart';

class FlutterShopApp extends ConsumerWidget {
  const FlutterShopApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Activation riverpod pour l'application
    return ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 27, 49),
            brightness: Brightness.dark,
          ),
        ),
        themeMode: ThemeMode.system,
        routerConfig: router,
        // home: ListProductPage(),
      ),
    );
  }
}
