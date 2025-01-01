import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        print("on click is workingg or not "),
       
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductDetails(productId: product.id)
        // )),
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.cyanAccent,
        elevation: 4.0,

       
        child: Column(
      
          children: <Widget>[
            Container(
        width: double.infinity, 
        height: 150, 
        decoration: BoxDecoration(
      color: Colors.transparent, 
      borderRadius: BorderRadius.circular(8.0), 
        ),
        child: ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
      child: Image.network(
        product.image,
        fit: BoxFit.cover, 
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.image_not_supported,
              color: Colors.grey,
              size: 50,
            ), 
          );
        },
      ),
        ),
      ),
      
            Padding( 
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(product.title.length>20 ? '${product.title.substring(0, 20)}...' : product.title),
            ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text('\$ ${product.price}'),
               
             
              ],
             ),
           )
          ],
        ),
      ),
    );
  }
  
}