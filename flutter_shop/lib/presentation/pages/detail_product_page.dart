import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/presentation/_widgets/product_detail_scaffold.dart';
import 'package:flutter_shop/product.dart';
import 'package:http/http.dart';

class DetailProductPage extends StatelessWidget {
  //récupérer l'id produit
  final String? idProduct;
  const DetailProductPage({super.key, required this.idProduct});

  @override
  Widget build(BuildContext context) {
    if (idProduct != null && int.tryParse(idProduct!) != null) {
      //récupérer le produit
      return FutureBuilder(
        future: fetchProductById(int.parse(idProduct!)),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData && asyncSnapshot.data != null) {
            return ProductDetailScaffold(product: asyncSnapshot.data!);
          } else if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(body: Center(child: Text("Produit introuvable")));
        },
      );
    } else {
      return Scaffold(body: Center(child: Text("Aucun produit trouvé")));
    }
  }
}

Future<Product> fetchProductById(int id) async {
  final responseProducts = await get(
    Uri.parse('https://fakestoreapi.com/products/$id'),
  );

  if (responseProducts.statusCode == 200) {
    return Product.fromMap(jsonDecode(responseProducts.body));
  } else {
    throw Exception('Failed to load products');
  }
}
