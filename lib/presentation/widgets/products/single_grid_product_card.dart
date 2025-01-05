import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/presentation/view/product_details/product_details.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleLayoutProductCard extends StatelessWidget {
  final Product product;

  SingleLayoutProductCard({Key? key, required this.product}) : super(key: key);

  final ProductBloc _productBloc = getIt<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Product tapped: ${product.title}");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(productId: product.id),
          ),
        ).then((_) {
          _productBloc.add(FetchProducts());
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Row(
          children: <Widget>[
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              child: Image.network(
                product.image,
                width: 120, 
                height: 120, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
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

            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                               Text(
                           product.category[0].toUpperCase() + product.category.substring(1).toLowerCase(),
                                 style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                        ),
                                 maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                           ),

                    Text(
                      product.title.length > 50
                          ? '${product.title.substring(0, 50)}...'
                          : product.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Product Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                // color: Colors.green,
                              ),
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.white,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
