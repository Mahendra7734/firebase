import 'package:firebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'google_map.dart';
import 'login.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';



class AuthService {
  //Determine if the user is authenticated and redirect accordingly
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            // user is authorozed hence redirect to home screen
            return Google_map();
          } else
            // user not authorized hence redirect to login page
            return login();
        });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Initiate the auth procedure
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();
    // fetch the auth details from the request made earlier
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    // Create a new credential for signing in with google
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    final GoogleSignIn googleUser =
    await GoogleSignIn(scopes: <String>["email"]);

    await _firebaseAuth.signOut();

    googleUser.signOut();
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }

    if (loginResult.status == LoginStatus.cancelled) {
      return Future.error('Login Cancelled');
    }
    if (loginResult.status == LoginStatus.failed) {
      return Future.error('Some Error Occured');
    }

    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
 // Login Method

  // facebookLogin() async {
  //   print("FaceBook");
  //   try {
  //     final result =
  //     await FacebookAuth.i.login(permissions: ['email', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //       print(userData);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }


 }


