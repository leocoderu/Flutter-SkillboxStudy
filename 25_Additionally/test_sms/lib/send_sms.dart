import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendSms extends StatefulWidget {
  const SendSms({super.key});

  @override
  State<SendSms> createState() => _SendSmsState();
}
class _SendSmsState extends State<SendSms> {
  static const platform = MethodChannel('sendSms');

  Future<void> sendSms() async {
    print("SendSMS");
    try {
      final String result = await platform.invokeMethod('send',<String,dynamic>{
        "phone":"+79184561762",
        "msg":"Hello! I'm sent programatically."
      });
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () => sendSms(),
            child: const Text("Send SMS")
        ),
    );
  }
}