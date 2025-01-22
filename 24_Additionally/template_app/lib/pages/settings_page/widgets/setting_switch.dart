// Import Flutter
import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final bool? enabled;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const SettingSwitch({super.key, this.enabled, this.icon, this.title,
    this.subtitle, required this.value, this.onChanged,});

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
            Switch.adaptive(
              applyCupertinoTheme: false,
              value: value,
              onChanged: onChanged ?? null,
            ),
          ],
        ),
      ),
    );
  }
}
