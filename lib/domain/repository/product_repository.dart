import 'package:ease_my_deal_assignment/core/exception/network_exception.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository{
  Future<Either<NetworkException, ProductList?>> getProducts();
}