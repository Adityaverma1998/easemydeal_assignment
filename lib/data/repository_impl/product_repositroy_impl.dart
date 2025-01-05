import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ease_my_deal_assignment/core/exception/network_exception.dart';
import 'package:ease_my_deal_assignment/data/data_source/remote/remote_data_source.dart';
import 'package:ease_my_deal_assignment/data/data_source/remote/remote_data_source.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';
import 'package:fpdart/src/either.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<NetworkException, ProductList?>> getProducts() async {
    try {
      final result = await _productRemoteDataSource.getProducts();
      return Right(result);
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, Product?>> getProductDetails(int id) async {
    try {
      final result = await _productRemoteDataSource.getProductDetails(id);

      log("check product details : $result");
      return Right(result);
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
