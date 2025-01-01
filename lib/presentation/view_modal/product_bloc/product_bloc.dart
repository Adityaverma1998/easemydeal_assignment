

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_details_usecase.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_usecase.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc({required this.getProductUsecase, required this.getProductDetailsUsecase}) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductDetails>(_onFetchProductDetails);
   }

    //usecase 
  final GetProductUsecase getProductUsecase;
  final GetProductDetailsUsecase getProductDetailsUsecase;






   // function to handle event
    Future<void> _onFetchProducts(
    FetchProducts event, Emitter<ProductState> emit) async {
  try {
    emit( ProductLoading(isLoading: true));

    final result = await getProductUsecase.call();
    result.fold(
      (failure) {
        // Handle failure case
        emit(ProductError(message: failure.toString()));
      },
     (products) {
        if (products != null && products.products != null) {
   emit(ProductLoaded(products: products));
       } else {
   emit(ProductError(message: 'No products available.'));
        }
     }
    );
  } catch (error) {
    emit(ProductError(message: error.toString()));
  }
}

// function to handle event
   Future<void> _onFetchProductDetails(
    FetchProductDetails event, Emitter<ProductState> emit) async {
  try {
    emit(ProductLoading(isLoading: true)); // Notify UI about loading

    final result = await getProductDetailsUsecase.call(params: event.id);
    result.fold(
      (failure) {
        // Handle failure case
        emit(ProductError(message: failure.message));
      },
      (product) {
        if (product != null) {
          emit(ProductDetailsLoaded(product: product));
        } else {
          emit(ProductError(message: 'No product details available.'));
        }
      },
    );
  } catch (error) {
    // Handle any unexpected errors
    emit(ProductError(message: 'Unexpected error: ${error.toString()}'));
  }
}

}