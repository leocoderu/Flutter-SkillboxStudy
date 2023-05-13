import 'package:flutter/foundation.dart';

import 'package:business_sm/di/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:data_sm/data_sm.dart';

class AuthController {
  Future<UserCredential?> authUser() async {
    if(kIsWeb) return locator.get<AuthRepo>().signInWithGoogleWeb();
    return locator.get<AuthRepo>().signInWithGoogle();
  }

  Future<Null> logOut() async {
    locator.get<AuthRepo>().signOut();
  }
}