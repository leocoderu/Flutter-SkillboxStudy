import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*class AuthFirebase extends StatelessWidget {
  const AuthFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return signIn();
        }
      },
    );
  }
}*/

void signIn(){
  if(kIsWeb){ signInWithGoogleWeb();}
  else { signInWithGoogle();}
}

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if(googleUser != null) {
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  return null;
}

Future<UserCredential?> signInWithGoogleWeb() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  googleProvider.addScope('https://www.googleapis.com/auth/contacts');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}