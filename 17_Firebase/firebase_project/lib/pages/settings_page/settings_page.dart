// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Layers
import 'package:business_sm/states/app_state.dart';
import 'package:model/model.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки',),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<AppStateBloc, AppStateModel>(
          builder: (_, state) {
            return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Настройка приложения'),
                  Transform.scale(
                    scale: 2,
                    child: Switch.adaptive(
                      value: state.summary_panel,
                      onChanged: (value) {
                        context.read<AppStateBloc>().add(EnableSummaryPanel(summary_panel: value));
                      },
                    ),
                  ),
                ],
            );
          },
        ),
      ),
    );
  }
}
