import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vos achats"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Row(
            children: [
              Text("Vous n'avez rien"), 
              Icon(Icons.shopping_cart)
              ]
          ),
        ],
      ),
    );
  }
}
