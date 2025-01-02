import 'dart:developer';

import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/hero_section.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/primary_layout.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/products/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductBloc _productBloc = getIt<ProductBloc>();

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }
   Future<void> _fetchProduct() async{
         _productBloc.add(FetchProducts());
   }
@override
void didChangeDependencies() {
  super.didChangeDependencies();

  if (_productBloc.state is! ProductLoading) {
   _fetchProduct();
  }
}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      isBack: false,
      child: RefreshIndicator(
        onRefresh:_fetchProduct ,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeroSection(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Products",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProductBloc, ProductState>(
                bloc: _productBloc,
                builder: (context, state) {
                  log("Current state: $state");
        
                  if (state is ProductLoading && state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
        
                  if (state is ProductLoaded) {
                    final products = state.products.products ?? [];
                    if (products.isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(product: product);
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('No products available.'),
                      );
                    }
                  }
        
                  if (state is ProductError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
        
                  return const Center(
                    child: Text('Unexpected state.'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
