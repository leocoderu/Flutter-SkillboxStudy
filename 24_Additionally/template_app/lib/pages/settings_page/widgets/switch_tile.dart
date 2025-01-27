// Import Flutter
import 'package:flutter/material.dart';
import 'package:template_app/pages/settings_page/widgets/triple_switch/triple_switch.dart';
import 'package:template_app/pages/settings_page/widgets/triple_switch/triple_switch_ui.dart';

class SwitchTile extends StatelessWidget {
  final bool? enabled;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final switchPosition value;
  final int? timeoutOffOn;
  final int? timeoutOnOff;
  final ValueChanged<switchPosition> onChanged;

  const SwitchTile({super.key, this.enabled, this.icon, this.title,
    this.subtitle, required this.value, this.timeoutOffOn, this.timeoutOnOff, required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled ?? true,
      leading: SizedBox(width: 40, child: Icon(icon, size: 30,)),
      title: Text(title ?? ''),
      subtitle: Text(subtitle ?? ''),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            VerticalDivider(),
            SizedBox(width: 20),
            TripleSwitch(
              swPos: value,
              timeoutOffOn: timeoutOffOn,
              timeoutOnOff: timeoutOnOff,
            ),
          ],
        ),
      ),
    );
  }
}
