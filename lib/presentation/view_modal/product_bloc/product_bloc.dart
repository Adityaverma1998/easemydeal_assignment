

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_usecase.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc({required this.getProductUsecase}) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
   }

    //usecase 
  final GetProductUsecase getProductUsecase;






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
}