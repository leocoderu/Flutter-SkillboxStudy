// Import Flutter
import 'package:flutter/material.dart';
import 'package:template_app/pages/settings_page/widgets/decoration_switch.dart';
import 'package:template_app/pages/settings_page/widgets/triple_switch.dart';

class SettingSwitchTwo extends StatelessWidget {
  final bool? enabled;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final switchPosition position;
  final VoidCallback onTap;

  const SettingSwitchTwo({super.key, this.enabled, this.icon, this.title,
    this.subtitle, required this.position, required this.onTap,});

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
              enabled: true,
              value: position, //switchPosition.wait,

              decorationTrackOn: decorationTrackOn,
              decorationTrackOff: decorationTrackOff,
              decorationTrackWait: decorationTrackWait,
              decorationTrackDisabled: decorationTrackDisabled,
              decorationSliderOn: decorationSliderOn,
              decorationSliderOff: decorationSliderOff,
              decorationSliderWait: decorationSliderWait,
              decorationSliderDisabled: decorationSliderDisabled,
              textOn: 'ON',
              textOff: 'OFF',
              textWait: '60',
              textDisabled: 'DIS',
              textStyleEnabled: textStyleEnabled,
              textStyleDisabled: textStyleDisabled,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
