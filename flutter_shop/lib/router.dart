import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/detail_product_page.dart';
import 'package:flutter_shop/pages/list_product_page.dart';
import 'package:flutter_shop/product.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        children: [
          Text("La route ${state.uri} n'existe pas"),
          Text("Revenir à l'accueil"),
          OutlinedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text("Accueil"),
          ),
        ],
      ),
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ListProductPage(),
      routes: <RouteBase>[
        GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
        GoRoute(
          path: '/product/:idProduct',
          builder: (context, state) {
            return DetailProductPage(
              idProduct: state.pathParameters['idProduct'],
            );
          },
        ),
      ],
    ),
  ],
);
