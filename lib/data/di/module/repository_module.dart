import 'package:ease_my_deal_assignment/data/data_source/local/local_data_source_app_setting.dart';
import 'package:ease_my_deal_assignment/data/data_source/remote/remote_data_source.dart';
import 'package:ease_my_deal_assignment/data/repository_impl/app_setting_repository.dart';
import 'package:ease_my_deal_assignment/data/repository_impl/product_repositroy_impl.dart';
import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/repository/app_setting_repository.dart';
import 'package:ease_my_deal_assignment/domain/repository/product_repository.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {

    // remote data
    getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
      getIt<ProductRemoteDataSource>(),
    ));

    //local data
    getIt.registerSingleton<AppSettingRepository>(AppSettingRepositoryImpl(
      getIt<LocalDataSourceAppSetting>(),
     ));

  }
  }