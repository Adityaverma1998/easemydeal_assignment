import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/repository/app_setting_repository.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';
import 'package:ease_my_deal_assignment/domain/usecase/app_setting/get_app_setting_usecase.dart';
import 'package:ease_my_deal_assignment/domain/usecase/app_setting/update_app_setting_usecase.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_details_usecase.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    
  getIt.registerSingleton<GetProductUsecase>(
      GetProductUsecase(getIt<ProductRepository>()),
    ); 

    getIt.registerSingleton<GetProductDetailsUsecase>(
      GetProductDetailsUsecase(getIt<ProductRepository>()),
    );

    getIt.registerSingleton<GetAppSettingUsecase>(
      GetAppSettingUsecase(getIt<AppSettingRepository>()),
    );  
    getIt.registerSingleton<UpdateAppSettingUsecase>(
      UpdateAppSettingUsecase(getIt<AppSettingRepository>()),
    );  
    
  }
    
}