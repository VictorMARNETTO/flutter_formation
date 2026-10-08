import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/presentation/_widgets/product_list_view.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon panier'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RowTotal(
              total: cart.isNotEmpty
                  ? ref.read(cartProvider.notifier).totalPrice
                  : 0,
            ),
          ),
          Expanded(
            child: cart.isEmpty
                ? const EmptyCart()
                : ProductListView(products: cart, isCart: true),
          ),
        ],
      ),
    );
  }
}

class RowTotal extends StatelessWidget {
  final num total;

  const RowTotal({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Votre panier total est de'),
        const Spacer(),
        Text(
          '${total.toStringAsFixed(2)} €',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Votre panier est actuellement vide'),
          Icon(Icons.photo),
        ],
      ),
    );
  }
}
