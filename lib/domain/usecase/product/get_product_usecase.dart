import 'package:ease_my_deal_assignment/core/exception/network_exception.dart';
import 'package:ease_my_deal_assignment/core/usecase.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductUsecase
    extends UsecaseEmptyParams<Either<NetworkException, ProductList?>, void> {
  final ProductRepository _productRepository;

  GetProductUsecase(this._productRepository);

  @override
  Future<Either<NetworkException, ProductList?>> call() async {
    return await _productRepository.getProducts();
  }
}
