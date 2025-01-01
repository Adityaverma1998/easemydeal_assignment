import 'dart:async';

import 'package:ease_my_deal_assignment/core/exception/network_exception.dart';
import 'package:ease_my_deal_assignment/core/usecase.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductDetailsUsecase extends Usecase<Either<NetworkException, Product?>, int >{
   final ProductRepository _productRepository;
  GetProductDetailsUsecase(this._productRepository);
  
  @override
  FutureOr<Either<NetworkException, Product?>> call({required int params}) async{
        return  await _productRepository.getProductDetails(params);

  }

}