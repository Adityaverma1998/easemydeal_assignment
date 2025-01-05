import 'dart:developer';

class Product {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final Rating rating;

  Product(
      {required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title,
      required this.category,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
      rating: Rating.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'rating': rating.toJson(),
    };
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

class ProductList {
  final List<Product>? products;
  ProductList({this.products});
  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> products =
        json.map((product) => Product.fromJson(product)).toList();

    return ProductList(products: products);
  }
}
