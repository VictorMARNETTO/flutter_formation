import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/product.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  final bool isCart;
  const new({super.key, required this.products, this.isCart = false});

  @override
  Widget build(BuildContext context) {
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
                  Provider.of<Cart>(
                    context,
                    listen: false,
                  ).removeProduct(products[index]);
                } else {
                  Provider.of<Cart>(
                    context,
                    listen: false,
                  ).addProduct(products[index]);
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
