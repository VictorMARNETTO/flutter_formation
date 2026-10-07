import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/product.dart';
import 'package:http/http.dart';

class DetailProductPage extends StatelessWidget {
  //récupérer l'id produit
  final String? idProduct;
  const DetailProductPage({super.key, required this.idProduct});

  //récupérer le produit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Détail du produit'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: fetchProductById(int.parse(idProduct!)),
          builder: (context, asyncSnapshot) {
            return Column(
              children: [
                SizedBox(height: 16),
                Image.network(asyncSnapshot.data!.image, height: 350),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(product.getPriceInEuro()),
                      // Text(
                      //   product.category,
                      //   style: Theme.of(context).textTheme.titleSmall,
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(product.description),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: FilledButton(
                      onPressed: () {
                        // Ajouter le produit au panier
                      },
                      child: Text("Ajouter au panier"),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
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
