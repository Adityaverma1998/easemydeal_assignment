import 'package:ease_my_deal_assignment/core/dio_client/dio_client.dart';
import 'package:ease_my_deal_assignment/data/data_source/remote/remote_data_source.dart';
import 'package:ease_my_deal_assignment/di/service_locator.dart';

mixin NetworkModule {
  static Future<void> configureProductDataSourceModuleInjection() async {
  

        // api's:-------------------------------------------------------------------
    // API dependencies
    getIt.registerSingleton(ProductRemoteDataSource(getIt<DioClient>()));

    
  }
}
