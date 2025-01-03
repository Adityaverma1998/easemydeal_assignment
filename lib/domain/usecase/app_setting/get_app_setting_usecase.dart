import 'package:ease_my_deal_assignment/core/exception/network_exception.dart';
import 'package:ease_my_deal_assignment/core/usecase.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:ease_my_deal_assignment/domain/repository/app_setting_repository.dart';

class GetAppSettingUsecase extends UsecaseEmptyParams<AppSetting, void> {
  final AppSettingRepository _appSettingRepository;

  GetAppSettingUsecase(this._appSettingRepository);

  @override
  Future<AppSetting> call() async {
    return await _appSettingRepository.getAppConfig();
  }
}
