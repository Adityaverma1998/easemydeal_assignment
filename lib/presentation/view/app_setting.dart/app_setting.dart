import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/app_setting_bloc/app_setting_bloc.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettingScreen extends StatelessWidget {
  final AppSettingBloc _appSettingBloc = getIt<AppSettingBloc>();

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        bloc: _appSettingBloc,
        builder: (context, state) {
          if (state is AppSettingLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AppSettingLoadedState) {
            return _buildSettingsForm(context, state.appSetting);
          } else if (state is AppSettingErrorState) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  Widget _buildSettingsForm(BuildContext context, AppSetting appSetting) {
    Layout selectedLayout = appSetting.layout;
    ThemeType selectedTheme = appSetting.theme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Layout Selection
          _buildSectionTitle('Select Layout:'),
          Row(
            children: [
              _buildRadioOption<Layout>(
                title: 'Single',
                value: Layout.single,
                groupValue: selectedLayout,
                onChanged: (value) {
                  _updateSetting(context, appSetting.copyWith(layout: value!));
                },
              ),
              const SizedBox(width: 24),
              _buildRadioOption<Layout>(
                title: 'Grid',
                value: Layout.grid,
                groupValue: selectedLayout,
                onChanged: (value) {
                  _updateSetting(context, appSetting.copyWith(layout: value!));
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Theme Selection
          _buildSectionTitle('Select Theme:'),
          Row(
            children: [
              _buildRadioOption<ThemeType>(
                title: 'Light',
                value: ThemeType.light,
                groupValue: selectedTheme,
                onChanged: (value) {
                  _updateSetting(context, appSetting.copyWith(theme: value!));
                },
              ),
              const SizedBox(width: 24),
              _buildRadioOption<ThemeType>(
                title: 'Dark',
                value: ThemeType.dark,
                groupValue: selectedTheme,
                onChanged: (value) {
                  _updateSetting(context, appSetting.copyWith(theme: value!));
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Additional Toggles
          _buildSwitchOption(
            context: context,
            title: 'Show Search Icon',
            value: appSetting.showSearchIcon,
            onChanged: (value) {
              _updateSetting(
                  context, appSetting.copyWith(showSearchIcon: value));
            },
          ),
          _buildSwitchOption(
            context: context,
            title: 'Show Wishlist Icon',
            value: appSetting.showWishListIcon,
            onChanged: (value) {
              _updateSetting(
                  context, appSetting.copyWith(showWishListIcon: value));
            },
          ),
          _buildSwitchOption(
            context: context,
            title: 'Show Cart Icon',
            value: appSetting.showCartIcon,
            onChanged: (value) {
              _updateSetting(context, appSetting.copyWith(showCartIcon: value));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRadioOption<T>({
    required String title,
    required T value,
    required T groupValue,
    required void Function(T?) onChanged,
  }) {
    return Expanded(
      child: ListTile(
        title: Text(title),
        leading: Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildSwitchOption({
    required BuildContext context,
    required String title,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Method to Dispatch Bloc Event
  void _updateSetting(BuildContext context, AppSetting updatedSetting) {
    context
        .read<AppSettingBloc>()
        .add(SaveAppSettingEvent(appSetting: updatedSetting));
  }
}
