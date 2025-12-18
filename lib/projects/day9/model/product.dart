import 'rating.dart';

class Product {
  int id;
  String title;
  String description;
  String image;
  dynamic price;
  String category;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rating
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
      rating: Rating.fromJson(json['rating'] ?? {})
    );
  }
}