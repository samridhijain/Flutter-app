//https://github.com/sujanbhattaraiofficial/facebook-login/blob/main/fblogin/lib/facebooklogin/loginWithFacebook.dart
//Learn from this url
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Facebook extends StatefulWidget {
  @override
  _FacebookState createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  bool isSignIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  static final FacebookLogin facebookLogin = FacebookLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Facebook"),
          MaterialButton(
            onPressed: () async {
              final FacebookLoginResult result =
                  await facebookLogin.logIn(['email']);

              switch (result.status) {
                case FacebookLoginStatus.loggedIn:
                  try {
                    await loginWithfacebook(result);
                  } catch (e) {
                    print(e);
                  }
                  /*final FacebookAccessToken accessToken = result.accessToken;
                  print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');*/
                  break;
                case FacebookLoginStatus.cancelledByUser:
                  print('Login cancelled by the user.');
                  break;
                case FacebookLoginStatus.error:
                  print('Something went wrong with the login process.\n'
                      'Here\'s the error Facebook gave us: ${result.errorMessage}');
                  break;
              }
            },
            child: Text("Login"),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              gooleSignout();
            },
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      isSignIn = true;
      _user = a.user;
    });
  }

  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      setState(() {
        facebookLogin.logOut();
        isSignIn = false;
      });
    });
  }
}
