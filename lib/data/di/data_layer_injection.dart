import 'package:ease_my_deal_assignment/data/data_source/local/local_data_source_app_setting.dart';
import 'package:ease_my_deal_assignment/data/di/module/local_module.dart';
import 'package:ease_my_deal_assignment/data/di/module/remote_module.dart';
import 'package:ease_my_deal_assignment/data/di/module/repository_module.dart';

mixin DataLayerInjection {
  static Future<void> configureProductDataLayerInjection() async {
    await LocalModule.configureLocalModuleInjection();
    await NetworkModule.configureDataSourceModuleInjection();
    await RepositoryModule.configureRepositoryModuleInjection();
  }
}