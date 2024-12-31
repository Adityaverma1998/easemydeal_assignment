part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}
class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  final bool isLoading;
  const ProductLoading({required this.isLoading});
  @override
  List<Object?> get props => [isLoading];
}


class ProductLoaded extends ProductState {
  final ProductList products;

  const ProductLoaded({required this.products});
    
  @override
  List<Object?> get props => [products];
}
class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}