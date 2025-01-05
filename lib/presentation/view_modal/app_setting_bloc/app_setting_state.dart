part of 'app_setting_bloc.dart';

abstract class AppSettingState {}

class AppSettingInitialState extends AppSettingState {}

class AppSettingLoadingState extends AppSettingState {}

class AppSettingLoadedState extends AppSettingState {
  final AppSetting appSetting;
  AppSettingLoadedState(this.appSetting);
}

class AppSettingSavedState extends AppSettingState {}

class AppSettingErrorState extends AppSettingState {
  final String error;
  AppSettingErrorState(this.error);
}
