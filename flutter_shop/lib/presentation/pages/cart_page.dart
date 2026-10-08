import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/presentation/_widgets/product_list_view.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon panier"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.products.isEmpty) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RowTotal(total: 0),
                ),
                EmptyCart(),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RowTotal(total: cart.totalPrice),
                ),
                Expanded(
                  child: ProductListView(products: cart.products, isCart: true),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class RowTotal extends StatelessWidget {
  final num total;
  const new({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Votre panier total est de"),
        Spacer(),
        Text(
          "${total.toStringAsFixed(2)}€",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class EmptyCart extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Votre panier est actuellement vide"),
          Icon(Icons.photo),
        ],
      ),
    );
  }
}
