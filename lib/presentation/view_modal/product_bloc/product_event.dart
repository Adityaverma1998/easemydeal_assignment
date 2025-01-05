part of 'product_bloc.dart';

abstract class ProductEvent {}

class FetchProducts extends ProductEvent {
  FetchProducts();
}

class FetchProductDetails extends ProductEvent {
  final int id;
  FetchProductDetails({required this.id});
}
