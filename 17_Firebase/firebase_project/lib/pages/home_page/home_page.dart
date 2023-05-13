// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:fluttertoast/fluttertoast.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import Layers
import 'package:business_sm/business_sm.dart';

// Import Widgets
import 'package:firebase_project/pages/home_page/drawer_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String photoURL = '';

  @override
  void initState() {
    super.initState();
    getUserPhoto();
  }

  void getUserPhoto() async {
    String? phURL;
    var _user = await locator.get<AuthController>().authUser();
    if (_user != null) {
      var _uUser= _user.user;
      if (_uUser != null) { phURL = _user.user!.photoURL; };
    }
    setState(() {
      photoURL = phURL ?? '';
    });
  }

  DateTime? backButtonPressedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store App'),
        centerTitle: true,
      ),
      drawer: DrawerWidget(photoURL: photoURL),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Welcome to Store'),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressedTime == null || currentTime.difference(backButtonPressedTime!) > Duration(seconds: 3);
    if(backButton){
      backButtonPressedTime = currentTime;
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.msgButToast,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    };
    return true;
  }
}
