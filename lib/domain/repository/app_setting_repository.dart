import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';

abstract class AppSettingRepository {

  Future<void> changeAppConfig(AppSetting appSetting);
  
  Future<AppSetting> getAppConfig();
}