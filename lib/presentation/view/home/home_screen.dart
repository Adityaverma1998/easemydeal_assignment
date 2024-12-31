import 'dart:developer';

import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
  builder: (context, state) {
    log("Current state: $state"); 

    if (state is ProductLoading && state.isLoading) {

      return const Center(child: CircularProgressIndicator());

    } else if (state is ProductLoaded) {
      log("check loaded state ${state.products}");
      final products = state.products;
      if (products.products!.isNotEmpty) {
        return GridView.builder(
          itemCount: products.products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            final product = products.products![index];
            return Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description ?? 'No Description',
                      style: const TextStyle(fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return const Center(child: Text('No products available.'));
      }
    } else if (state is ProductError) {
      return Center(
        child: Text(
          'Error: ${state.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    } else {
      return const Center(child: Text('No products available.'));
    }
  },
);

  }}
