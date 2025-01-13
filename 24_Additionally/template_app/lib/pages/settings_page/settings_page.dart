// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool systemTheme = locator.get<ThemeController>().get() == ThemeMode.system;
  bool darkTheme = locator.get<ThemeController>().get() == ThemeMode.dark; //light ? false : true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.settings_title),
          ),
          body: Center(
            child: ListView(
              children: [
                ListTile(
                  leading: SizedBox(width: 40, child: Icon(Icons.sunny, size: 30,)),
                  title: const Text('System theme'),
                  subtitle: Text('On / Off System theme'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(),
                        SizedBox(width: 20),
                        Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: systemTheme,
                          onChanged: (value) {
                            (value)
                                ? ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.system))
                                : ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.light));
                            setState(() {
                              systemTheme = value;
                              darkTheme = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  enabled: !systemTheme,
                  leading: SizedBox(width: 40, child: Icon(Icons.dark_mode, size: 30)),
                  title: const Text('Dark theme'),
                  subtitle: Text('On / Off Dark theme'),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(),
                        SizedBox(width: 20),
                        Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: darkTheme,
                          onChanged: systemTheme ? null
                            : (value) {
                                (value)
                                    ? ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.dark))
                                    : ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.light));
                                setState(() {
                                  darkTheme = value;
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
