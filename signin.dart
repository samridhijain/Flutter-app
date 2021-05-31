import 'package:flutter/material.dart';
import 'package:loginpage/screens/gmailauth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthClass authClass = AuthClass();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
////////////////////////////////////     Welcome Text     //////////////////////////////////////////////////
              Text(
                "Welcome To IKKHU RAS",
                style: TextStyle(
                  fontSize: 20,
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

///////////////////////////////////    LOGO      //////////////////////////////////////////
              /*Image.asset(
                'images\aa.jpeg',
                //width: double.infinity,
                //height: double.infinity,
                //fit: BoxFit.scaleDown,
              ),*/
/////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
///////////////////////////////////     ButtonItem     ////////////////////////////////////////////////
              buttonItem(
                "Continue with Gmail",
                () async {
                  await authClass.googleSignIn(context);
                },
              ),
              buttonItem("Continue with Facebook", () {}),
              buttonItem("Continue with Phone", () {
                Navigator.pushNamed(context, "/phoneauth");
              }),
//////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
////////////////////////////////////       or     /////////////////////////////////////////////////
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(
                        fontSize: 18.0, height: 1.0, color: Colors.black),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ),
                ],
              ),
/////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),

/////////////////////////////////////       TextFormField    //////////////////////////////////////////////////////////
              //textItem(_email, false, "Email Address.."),
              textItem(false, "Email Address"),
              SizedBox(
                height: 10,
              ),
              textItem(true, "Password..."),
//////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
///////////////////////////////////   Login   /////////////////////////////////////////////////////////
              LoginButton(),
/////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
//////////////////////////////////  Signup   /////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don't have an Account? ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/signup2");
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
//////////////////////////////////      Forgot Password      ////////////////////////////////////////
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/forgotpassword");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
//////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
///////////////////////////////       Terms Statement      ///////////////////////////////////////////////////////////////
              Text(
                "By Continuing, you agree to IKKHU RAS terms of use and Privacy Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  //fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&//////
  ///
/////////////////////////////////////         FUNCTIONS       ////////////////////////////////////////////////
  ///
////////////////////////////////////         ButtonItem Function      ////////////////////////////////////////////////
  Widget buttonItem(String buttonName, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        child: Card(
          //color: Colors.amber,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 1,
              //color: Colors.blue,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("logo"), // Add logo here
              SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  //color: Colors.red,
                ),
              ), //Add style
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

////////////////////////////////////       TextFormField  FUNCTIONS       ////////////////////////////////////////////////
  //////// Add validation here
  Widget textItem(bool obscureText, String labeltext) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      //color: Colors.yellow,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.blueGrey.shade100,
      ),
      child: TextFormField(
        //controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          //color: Colors.red,
        ),
        decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.pink,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
              ),
            )),
        cursorColor: Colors.pink,
      ),
    );
  }

////////////////////////////////////     LoginButton    FUNCTIONS       ////////////////////////////////////////////////
  Widget LoginButton() {
    return InkWell(
      onTap: () {}, // Add function and snackbar
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Colors.green.shade900,
          gradient: LinearGradient(colors: [
            Color(0xfffd746c),
            Color(0xffff9068),
            Color(0xfffd746c)

            /*Colors.green.shade900,
            Colors.green.shade300,
            Colors.white,
            Colors.green.shade300,
            Colors.green.shade900,*/
          ]),
        ),
        child: Center(
          child: Text(
            // Add ProgressIndicator
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////
}
