import 'package:ease_my_deal_assignment/data/data_source/local/local_data_source_app_setting.dart';
import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerLazySingleton(() => sharedPreferences);

    getIt.registerLazySingleton<LocalDataSourceAppSetting>(
        () => LocalDataSourceAppSetting(getIt<SharedPreferences>()));
  }
}

