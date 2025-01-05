import 'dart:developer';

import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/app_setting_bloc/app_setting_bloc.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/hero_section.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/primary_layout.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/products/product_card.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/products/single_grid_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductBloc _productBloc = getIt<ProductBloc>();
  final AppSettingBloc _appSettingBloc = getIt<AppSettingBloc>();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() {
    _productBloc.add(FetchProducts());
    _appSettingBloc.add(LoadAppSettingEvent());
  }

  @override
  void dispose() {
    _productBloc.close();
    _appSettingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      isBack: false,
      child: RefreshIndicator(
        onRefresh: () async => _fetchProducts(),
        child: BlocBuilder<AppSettingBloc, AppSettingState>(
          bloc: _appSettingBloc,
          builder: (context, appSettingState) {
            if (appSettingState is AppSettingLoadedState) {
              final useGridLayout = appSettingState.appSetting.layout;
              return _buildContent(useGridLayout);
            } else if (appSettingState is AppSettingErrorState) {
              return const Center(
                child: Text(
                  'Failed to load app settings',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return  const Center(
                child: Text(
                  'Failed to load app settings',
                  style: TextStyle(color: Colors.red),
                ),
              );
          },
        ),
      ),
    );
  }

  Widget _buildContent(Layout useGridLayout) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeroSection(),
          _buildHeader(),
          BlocBuilder<ProductBloc, ProductState>(
            bloc: _productBloc,
            builder: (context, state) => _buildProductSection(state, useGridLayout),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Latest Products",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection(ProductState state, Layout useGridLayout) {
    log("Current state: $state");

    if (state is ProductLoading && state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ProductLoaded) {
      final products = state.products.products ?? [];
      return products.isNotEmpty
          ? (useGridLayout == Layout.grid
              ? _buildProductGrid(products)
              : _buildProductList(products))
          : const Center(child: Text('No products available.'));
    }

    if (state is ProductError) {
      return Center(
        child: Text(
          'Error: ${state.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    // Default fallback
    return const Center(child: Text('Unexpected state.'));
  }

  Widget _buildProductGrid(List<Product> products) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        );
      },
    );
  }

  Widget _buildProductList(List<Product> products) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return SingleLayoutProductCard(product: product);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8.0);
      },
    );
  }
}
