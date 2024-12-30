class Product{
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;

  Product({required this.description,required this.id,required this.image,required this.price,required this.title});
  
  factory Product.fromJson(Map<String,dynamic> json){
    return Product(id: json['id'],title:json['title'], description: json['description'],price:json['price'], image:json['image'] );
  }

  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'price':price,
      'image':image
    };
  }
}