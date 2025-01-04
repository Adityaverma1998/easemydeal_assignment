import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/presentation/view/product_details/product_details.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;

   ProductCard({super.key, required this.product});

   final ProductBloc _productBloc = getIt<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Product tapped: ${product.title}");
       Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProductDetails(productId: product.id, )),
).then((_) {
 _productBloc.add(FetchProducts());});



      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.amberAccent,
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, 
          
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  height: 120, 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 8.0,
                top:8.0,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.white,)))
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title.length > 20
                    ? '${product.title.substring(0, 20)}...'
                    : product.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    // fontWeight: FontWeight.w800,
                    // height: 1.5,
                    // color: const Color(0xFF737A83)
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Price section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    // height: 1.5,
                    // color: const Color(0xFF737A83)
                    ),
              ),
                  
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
