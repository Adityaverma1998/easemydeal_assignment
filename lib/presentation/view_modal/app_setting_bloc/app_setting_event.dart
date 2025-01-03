part of 'app_setting_bloc.dart';

abstract class AppSettingEvent {}

class LoadAppSettingEvent extends AppSettingEvent {}

class SaveAppSettingEvent extends AppSettingEvent {
  final AppSetting appSetting;

  SaveAppSettingEvent({required this.appSetting});
}
