import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serialization_codgen/pages/http_dio.dart';
import 'package:serialization_codgen/pages/login_view.dart';


void main() async {
  // Подключаем корневой серртификат, иначе будет выдавать ошибку при рукопожатии
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => const LoginView(),
        '/home' : (BuildContext context) => const HTTPDIO(),
      },
    );
  }
}

