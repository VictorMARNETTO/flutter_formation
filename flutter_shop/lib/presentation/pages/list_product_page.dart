import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/presentation/_widgets/product_list_view.dart';
import 'package:flutter_shop/product.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class ListProductPage extends ConsumerWidget {
  const ListProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("E-Commerce"),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/cart');
            },
            icon: Badge.count(
              count: ref.watch(cartProvider).length,
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchListProducts(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData && asyncSnapshot.data?.isNotEmpty == true) {
            return ProductListView(products: asyncSnapshot.data!);
          } else {
            return Text(asyncSnapshot.error?.toString() ?? "An error occurred");
          }
        },
      ),
    );
  }

  Future<List<Product>> fetchListProducts() async {
    final responseProducts = await get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (responseProducts.statusCode == 200) {
      final listMap = jsonDecode(responseProducts.body) as List;
      final listProducts = listMap
          .map((map) => Product.fromMap(map as Map<String, dynamic>))
          .toList();
      return listProducts;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
