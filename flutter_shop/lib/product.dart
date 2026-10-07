// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  // Propriete du produit
  final int id;
  final num price;
  final String name;
  final String description;
  final String image;
  final String category;

  // Constructeur avec param nomme
  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.description,
    required this.image,
    required this.category,
  });

  // Methode qui retourne le prix en euro
  String getPriceInEuro() => "$price€";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'title': name,
      'description': description,
      'image': image,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      price: map['price'] as num,
      name: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
