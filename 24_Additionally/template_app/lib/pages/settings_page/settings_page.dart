// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_switch/triple_switch.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';
import 'package:model_layer/model_layer.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template_app/pages/settings_page/widgets/switch_tile.dart';

//import 'package:template_app/pages/settings_page/widgets/triple_switch/triple_switch_ui.dart';

// Import Widgets
import 'widgets/setting_switch.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  SwitchPosition swPos = SwitchPosition.off;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme state) {
        return Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings_title)),
          body: BlocBuilder<AppBloc, AppState>(
              builder: (BuildContext appCtx, AppState appState) {
                return Center(
                  child: ListView(
                    children: [
                      SettingSwitch(
                        icon: Icons.sunny,
                        title: AppLocalizations.of(context)!.settings_swSystemTheme_title,
                        subtitle: AppLocalizations.of(context)!.settings_swSystemTheme_subtitle,
                        value: locator.get<ThemeController>().get() == ThemeMode.system,
                        onChanged: (value) {
                          (value)
                              ? ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.system))
                              : ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.light));
                        },
                      ),
                      SettingSwitch(
                        enabled: locator.get<ThemeController>().get() != ThemeMode.system,
                        icon: Icons.dark_mode,
                        title: AppLocalizations.of(context)!.settings_swDarkTheme_title,
                        subtitle: AppLocalizations.of(context)!.settings_swDarkTheme_subtitle,
                        value: locator.get<ThemeController>().get() == ThemeMode.dark,
                        onChanged: locator.get<ThemeController>().get() == ThemeMode.system ? null
                            : (value) {
                          (value)
                              ? ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.dark))
                              : ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.light));
                        },
                      ),
                      Divider(),
                      SettingSwitch(
                        icon: Icons.security,
                        title: AppLocalizations.of(context)!.settings_swAuthLocal_title,
                        subtitle: AppLocalizations.of(context)!.settings_swAuthLocal_subtitle,
                        value: appState.auth_local ?? false,
                        onChanged: (value) => ctx.read<AppBloc>().add(ChangeAuthLocal(value: value)),
                      ),
                      SettingSwitch(
                        icon: Icons.lock_open,
                        title: AppLocalizations.of(context)!.settings_swAutoLogin_title,
                        subtitle: AppLocalizations.of(context)!.settings_swAutoLogin_subtitle,
                        value: appState.auto_login ?? false,
                        onChanged: (value) => ctx.read<AppBloc>().add(ChangeAutoLogin(value: value)),
                      ),

                      SwitchTile(
                        icon: Icons.recycling,
                        title: 'Тест Triple switch',
                        subtitle: 'Тестирование виджета',
                        value: swPos,       // TODO: Get it from Hive
                        timeoutOffOn: 20,   // Timeout when switching Off -> On
                        timeoutOnOff: 20,   // Timeout when switching On -> Off
                        onChanged: (value) => setState(() => swPos = value), // TODO: Save value to Hive
                      ),
                    ],
                  ),
                );
              },
          ),
        );
      },
    );
  }
}
