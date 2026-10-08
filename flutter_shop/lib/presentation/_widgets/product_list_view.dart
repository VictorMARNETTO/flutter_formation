import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/product.dart';
import 'package:go_router/go_router.dart';

class ProductListView extends ConsumerWidget {
  final List<Product> products;
  final bool isCart;
  const new({super.key, required this.products, this.isCart = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (_, _) => Divider(),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              context.go('/product/${products[index].id}');
            },
            leading: Image.network(
              products[index].image,
              width: 70,
              height: 70,
            ),
            title: Text(products[index].name, maxLines: 3),
            subtitle: Text(
              products[index].getPriceInEuro(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            trailing: TextButton(
              onPressed: () {
                if (isCart) {
                  ref
                      .read(cartProvider.notifier)
                      .removeProduct(products[index]);
                } else {
                  ref.read(cartProvider.notifier).addProduct(products[index]);
                }
              },
              child: isCart ? Icon(Icons.delete) : Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
