import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_details_usecase.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_usecase.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(
      {required this.getProductUsecase, required this.getProductDetailsUsecase})
      : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductDetails>(_onFetchProductDetails);
  }

  //usecase
  final GetProductUsecase getProductUsecase;
  final GetProductDetailsUsecase getProductDetailsUsecase;

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading(isLoading: true));

      final result = await getProductUsecase.call();
      result.fold((failure) {
        emit(ProductError(message: failure.toString()));
      }, (products) {
        if (products != null && products.products != null) {
          emit(ProductLoaded(products: products));
        } else {
          emit(ProductError(message: 'No products available.'));
        }
      });
    } catch (error) {
      emit(ProductError(message: error.toString()));
    }
  }

  Future<void> _onFetchProductDetails(
      FetchProductDetails event, Emitter<ProductState> emit) async {
    try {
      emit(const ProductDetailsLoading(
          isLoading: true)); 

      final result = await getProductDetailsUsecase.call(params: event.id);
      result.fold(
        (failure) {
          emit(ProductDetailsError(message: failure.message));
        },
        (product) {
          if (product != null) {
            emit(ProductDetailsLoaded(product: product));
          } else {
            emit(const ProductDetailsError(
                message: 'No product details available.'));
          }
        },
      );
    } catch (error) {
      emit(ProductDetailsError(
          message: 'Unexpected error: ${error.toString()}'));
    }
  }
}
