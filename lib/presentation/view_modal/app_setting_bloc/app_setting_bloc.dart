import 'package:ease_my_deal_assignment/domain/usecase/app_setting/get_app_setting_usecase.dart';
import 'package:ease_my_deal_assignment/domain/usecase/app_setting/update_app_setting_usecase.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final GetAppSettingUsecase appSettingUsecase;
  final UpdateAppSettingUsecase updateAppSettingUsecase;

  AppSettingBloc({
    required this.appSettingUsecase,
    required this.updateAppSettingUsecase,
  }) : super(AppSettingInitialState()) {
    on<LoadAppSettingEvent>(_onLoadAppSettingEvent);
    on<SaveAppSettingEvent>(_onSaveAppSettingEvent);
  }

  Future<void> _onLoadAppSettingEvent(
    LoadAppSettingEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(AppSettingLoadingState());
    try {
      final appSetting = await appSettingUsecase.call();
      emit(AppSettingLoadedState(appSetting));
    } catch (error) {
      emit(AppSettingErrorState('Failed to load app settings: $error'));
    }
  }

  Future<void> _onSaveAppSettingEvent(
    SaveAppSettingEvent event,
    Emitter<AppSettingState> emit,
  ) async {
    emit(AppSettingLoadingState());
    try {
      await updateAppSettingUsecase.call(params: event.appSetting );
      emit(AppSettingSavedState());
    } catch (error) {
      emit(AppSettingErrorState('Failed to save app settings: $error'));
    }
  }
}