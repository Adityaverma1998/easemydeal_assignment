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
        print("Check response data: ${response.data}");
         ProductList  productList = ProductList.fromJson(response.data);
        
        return productList;
      } else {
        print("Error: Response data is not a List. Data: ${response.data}");
        return null;
      }
    } catch (e) {
      print("Error fetching products: $e");
      rethrow;
    }
  }
}