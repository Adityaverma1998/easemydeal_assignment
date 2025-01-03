import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigStorage {
  static const String _configKey = 'appConfig';

  // Save AppConfig to SharedPreferences
  static Future<void> saveConfig(AppSetting config) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_configKey, config.toJson());
  }

  // Load AppConfig from SharedPreferences
  static Future<AppSetting> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final configString = prefs.getString(_configKey);

    if (configString != null) {
      return AppSetting.fromJson(configString as Map<String, dynamic>);
    } else {
      // Return default configuration if no saved data
      return AppSetting(
        layout: Layout.grid,
        theme: 'dark',
        padding: 8.0,
      );
    }
  }
}
