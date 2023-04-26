// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:app_firebase_shop/consts/translations.dart';
import 'package:app_firebase_shop/consts/urls.dart';
import 'package:app_firebase_shop/services/service_auth/service_auth.dart';

@LazySingleton(as: ServiceAuth)
class ServiceAuthImp implements ServiceAuth {
  @override
  void signin() {
    kIsWeb ? _signinWithGoogleWeb() : _signinWithGoogle();
  }

  @override
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  Future<UserCredential?> _signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }

  Future<UserCredential?> _signinWithGoogleWeb() async {
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    googleAuthProvider
        .addScope(urlGoogleAuth)
        .setCustomParameters(labelsAuthParameters);

    return await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
  }
}
