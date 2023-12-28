// Import Flutter
import 'package:flutter/material.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Layers
import 'package:business_sm/business_sm.dart';

// Import Firebase
import 'package:firebase_storage/firebase_storage.dart';

// Import Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Import Components
import 'package:firebase_project/pages/auth_page/auth_button.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: storage.ref('/images/auth_back.jpg').getDownloadURL(),
        builder: (_, snapBack) {
          return Container(
            width: double.infinity,
            decoration:  (snapBack.connectionState == ConnectionState.done && snapBack.data != null)
                ? BoxDecoration(image: DecorationImage(image: NetworkImage(snapBack.data!), fit: BoxFit.cover,),)
                : BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/ui/auth/auth_def.jpg'), fit: BoxFit.cover,),),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: FutureBuilder<String>(
                        future: storage.ref('/images/auth_logo.png').getDownloadURL(),
                        builder: (_, snapshot) => snapshot.connectionState == ConnectionState.done
                            ? Image.network(snapshot.data!, fit: BoxFit.scaleDown)
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    margin:EdgeInsets.only(top:50.0),
                    padding: EdgeInsets.all(30.0),
                    //color: Colors.blue,
                    height: 250.0,
                    width: 350,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 25.0),
                          child: Text(AppLocalizations.of(context)!.authMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AuthButton(
                              child: const FaIcon(FontAwesomeIcons.google, size: 30,),
                              quickAction: () async {
                                var _user = await locator.get<AuthController>().authUser();
                                if(_user != null) Navigator.of(context).pop;
                                //TODO: setState(); Обновить представление
                                //TODO: Согласовать данные пользователя Google и внутренней модели
                              },
                            ),
                            //AuthButton(child: const FaIcon(FontAwesomeIcons.facebookF, size: 30,),),
                            //AuthButton(child: const FaIcon(FontAwesomeIcons.twitter, size: 30,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
