// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';
import 'package:model_layer/model_layer.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:template_app/pages/settings_page/widgets/setting_switch2.dart';
import 'package:template_app/pages/settings_page/widgets/triple_switch/triple_switch.dart';

// Import Widgets
import 'widgets/setting_switch.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  switchPosition swPos = switchPosition.on;

  void _ChangePos() =>
    setState(() => swPos = swPos == switchPosition.on ? switchPosition.off : switchPosition.on);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.settings_title),
          ),
          body: BlocBuilder<AppBloc, AppState>(
              builder: (BuildContext appCtx, AppState appState) {
                return Center(
                  child: ListView(
                    children: [
                      SettingSwitch(
                        icon: Icons.sunny,
                        title: AppLocalizations.of(context)!.settings_swSystemTheme_title,
                        subtitle: AppLocalizations.of(context)!.settings_swSystemTheme_subtitle,
                        switcher: locator.get<ThemeController>().get() == ThemeMode.system,
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
                        switcher: locator.get<ThemeController>().get() == ThemeMode.dark,
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
                        switcher: appState.auth_local ?? false,
                        onChanged: (value) => ctx.read<AppBloc>().add(ChangeAuthLocal(value: value)),
                      ),
                      SettingSwitch(
                        icon: Icons.lock_open,
                        title: AppLocalizations.of(context)!.settings_swAutoLogin_title,
                        subtitle: AppLocalizations.of(context)!.settings_swAutoLogin_subtitle,
                        switcher: appState.auto_login ?? false,
                        onChanged: (value) => ctx.read<AppBloc>().add(ChangeAutoLogin(value: value)),
                      ),
                      SettingSwitchTwo(
                        icon: Icons.lock_open,
                        title: AppLocalizations.of(context)!.settings_swAutoLogin_title,
                        subtitle: AppLocalizations.of(context)!.settings_swAutoLogin_subtitle,
                        position: swPos,
                        onTap: () => _ChangePos(),
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
