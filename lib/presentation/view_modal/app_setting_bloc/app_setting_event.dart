part of 'app_setting_bloc.dart';

abstract class AppSettingEvent {}

class LoadAppSettingEvent extends AppSettingEvent {}

class SaveAppSettingEvent extends AppSettingEvent {
  final AppSetting appSetting;

  // Use named parameter here
  SaveAppSettingEvent({required this.appSetting});
}
