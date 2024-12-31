import 'package:ease_my_deal_assignment/presentation/di/store_module/store_module.dart';

mixin ProductPresentationLayerInjection {
  static Future<void> configurePresentationLayerInjection() async {
    await StoreModule.configureProductStoreModuleInjection();
  }
}