import 'package:ease_my_deal_assignment/data/di/module/remote_module.dart';
import 'package:ease_my_deal_assignment/data/di/module/repository_module.dart';

mixin DataLayerInjection {
  static Future<void> configureProductDataLayerInjection() async {
    await NetworkModule.configureDataSourceModuleInjection();
    await RepositoryModule.configureRepositoryModuleInjection();
  }
}