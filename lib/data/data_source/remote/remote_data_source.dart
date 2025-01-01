import 'dart:developer';

import 'package:ease_my_deal_assignment/core/constants/endpoints.dart';
import 'package:ease_my_deal_assignment/core/dio_client/dio_client.dart';
import 'package:ease_my_deal_assignment/domain/entity/product.dart';

class ProductRemoteDataSource{
  final DioClient _dioClient;
  ProductRemoteDataSource(this._dioClient);

  Future<ProductList?> getProducts() async {
    try {
      final response = await _dioClient.get(Endpoints.products);

      if (response.data is List) {
         ProductList  productList = ProductList.fromJson(response.data);
        
        return productList;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Product?> getProductDetails(int id) async {
    try {
      final response = await _dioClient.get('${Endpoints.products}/$id');
    if (response.data != null && response.data is Map<String, dynamic>) {
          log("api call date are here ${response.data}");

         Product  product = Product.fromJson(response.data);
        
        return product;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}