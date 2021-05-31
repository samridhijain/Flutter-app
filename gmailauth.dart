import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          print("Done.........");
        } catch (e) {
          print(e);
        }
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

// Instead of print put Snackbar here
  Future<String> verifyPhoneNumber(
      String phoneNumber, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    print(phoneNumber);
    String verificationId = "";
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      print("Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      print("Sorry we are not able to verify your phone Number");
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int forceResnedingtoken]) {
      print("Verification Code sent on the phone number");
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      print("Time out");
      return verificationId;
    };
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print(e.toString());
    }
    return verificationId;
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      //storeTokenAndData(userCredential);
      //This above command is for storage
      /*Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => HomePage()),
          (route) => false);

      showSnackBar(context, "logged In");*/
      print("logged In");
    } catch (e) {
      print(e.toString());
    }
  }
  /*void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }*/
}
