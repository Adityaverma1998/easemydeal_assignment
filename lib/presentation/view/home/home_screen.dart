import 'dart:developer';

import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/hero_section.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/primary_layout.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/products/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroSection(),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text("Latest Product",style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color:Colors.black,
                 ),),
              
              ],),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                log("Current state: $state");

                if (state is ProductLoading && state.isLoading) {
                  // Display loading indicator
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductLoaded) {
                  log("Loaded products: ${state.products}");

                  final products = state.products;

                  if (products.products != null && products.products!.isNotEmpty) {
                    // Display product grid
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.products!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        final product = products.products![index];
                        return ProductCard(product: product);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No products available.'),
                    );
                  }
                } else if (state is ProductError) {
                  return Center(
                    child: Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No products available.'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
