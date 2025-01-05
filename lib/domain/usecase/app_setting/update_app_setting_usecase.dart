import 'package:ease_my_deal_assignment/core/usecase.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:ease_my_deal_assignment/domain/repository/app_setting_repository.dart';

class UpdateAppSettingUsecase extends Usecase<void, AppSetting> {
  final AppSettingRepository _appSettingRepository;
  UpdateAppSettingUsecase(this._appSettingRepository);

  @override
  Future<void> call({required AppSetting params}) async {
    return await _appSettingRepository.changeAppConfig(params);
  }
}
