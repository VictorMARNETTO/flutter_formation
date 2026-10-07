import 'package:flutter/material.dart';
import 'package:flutter_shop/product.dart';
import 'package:go_router/go_router.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  const new({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (_, _) => Divider(),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              context.push(
                '/product/${products[index].id}',
                extra: products[index],
              );
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
            trailing: TextButton(onPressed: () {}, child: Text("ajouter")),
          ),
        );
      },
    );
  }
}
