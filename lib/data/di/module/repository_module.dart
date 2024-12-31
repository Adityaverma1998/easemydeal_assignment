import 'package:ease_my_deal_assignment/data/data_source/remote/remote_data_source.dart';
import 'package:ease_my_deal_assignment/data/repository_impl/product_repositroy_impl.dart';
import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      getIt<ProductRemoteDataSource>(),
     

    ));

  }
  }