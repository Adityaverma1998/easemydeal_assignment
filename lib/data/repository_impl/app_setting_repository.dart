import 'package:ease_my_deal_assignment/data/data_source/local/local_data_source_app_setting.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:ease_my_deal_assignment/domain/repository/app_setting_repository.dart';

class AppSettingRepositoryImpl implements AppSettingRepository {
  final LocalDataSourceAppSetting _localDataSourceAppSetting;
  AppSettingRepositoryImpl(this._localDataSourceAppSetting);

  @override
  Future<void> changeAppConfig(AppSetting config) async{
    await _localDataSourceAppSetting.saveConfig(config);
  }
  
  @override
  Future<AppSetting> getAppConfig() async{
    return await _localDataSourceAppSetting.loadConfig();
  }




}