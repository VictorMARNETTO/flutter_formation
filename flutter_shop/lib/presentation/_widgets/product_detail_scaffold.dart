import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/product.dart';
import 'package:provider/provider.dart';

class ProductDetailScaffold extends StatelessWidget {
  final Product product;
  const ProductDetailScaffold({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(product.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Image.network(product.image, height: 350),
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
                    context.read<Cart>().addProduct(product);
                  },
                  child: Text("Ajouter au panier"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
