import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    
  getIt.registerSingleton<GetProductUsecase>(
      GetProductUsecase(getIt<ProductRepository>()),
    );  
    
  }
    
}