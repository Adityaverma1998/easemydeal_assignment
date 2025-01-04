import 'package:ease_my_deal_assignment/core/constants/strings.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceAppSetting {
  final SharedPreferences _sharedPreferences;

  LocalDataSourceAppSetting(this._sharedPreferences);

  Future<void> saveConfig(AppSetting config) async {
    await _sharedPreferences.setString(Strings.configKey, config.toJson());
  }

  Future<AppSetting> loadConfig() async {
    final configString = _sharedPreferences.getString(Strings.configKey);

    if (configString != null) {
      return AppSetting.fromJsonString(configString);
    } else {
      return AppSetting(
        layout: Layout.grid,
        theme: ThemeType.light,
        padding: 8.0,
      );
    }
  }
}
