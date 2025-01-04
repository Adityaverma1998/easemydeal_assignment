import 'package:ease_my_deal_assignment/domain/entity/app_setting.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/app_setting_bloc/app_setting_bloc.dart';
import 'package:ease_my_deal_assignment/presentation/widgets/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
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
          Text(
            'Select Layout:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Single'),
            leading: Radio<Layout>(
              value: Layout.single,
              groupValue: selectedLayout,
              onChanged: (value) {
                _updateSetting(context, appSetting.copyWith(layout: value!));
              },
            ),
          ),
          ListTile(
            title: Text('Grid'),
            leading: Radio<Layout>(
              value: Layout.grid,
              groupValue: selectedLayout,
              onChanged: (value) {
                _updateSetting(context, appSetting.copyWith(layout: value!));
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Select Theme:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Light'),
            leading: Radio<ThemeType>(
              value: ThemeType.light,
              groupValue: selectedTheme,
              onChanged: (value) {
                _updateSetting(context, appSetting.copyWith(theme: value!));
              },
            ),
          ),
          ListTile(
            title: Text('Dark'),
            leading: Radio<ThemeType>(
              value: ThemeType.dark,
              groupValue: selectedTheme,
              onChanged: (value) {
                _updateSetting(context, appSetting.copyWith(theme: value!));
              },
            ),
          ),
        ],
      ),
    );
  }

  void _updateSetting(BuildContext context, AppSetting updatedSetting) {
  BlocProvider.of<AppSettingBloc>(context).add(SaveAppSettingEvent(appSetting: updatedSetting));
}


}
