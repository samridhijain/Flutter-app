import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
///////////////////////////////////   Forgotten your password?    //////////////////////////////////////////
              Text(
                "Forgotten your password?",
                style: TextStyle(
                  fontSize: 33,
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
/////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
///////////////////////////////////    Don't worry, we'll send you a message to help you reset your password.    //////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Don't worry, we'll send you a message to help you reset your password.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade600,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
/////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
/////////////////////////////////////       TextFormField    //////////////////////////////////////////////////////////
              //textItem(_email, false, "Email Address.."),
              textItem(false, "Email address or phone number..."),

//////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
///////////////////////////////////   Get Started!   /////////////////////////////////////////////////////////
              ContinueButton(),

/////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
//////////////////////////////////  Login   /////////////////////////////////////////////////////////

              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Text(
                  "Return to login",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
      child: Card(
        elevation: 15,
        //color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          /*side: BorderSide(
            width: 1,
            color: Colors.yellow,
          ),*/
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
                color: Colors.grey.shade600,
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
      ),
    );
  }

  ////////////////////////////////////     Continue    FUNCTIONS       ////////////////////////////////////////////////
  Widget ContinueButton() {
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
            "Continue",
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
