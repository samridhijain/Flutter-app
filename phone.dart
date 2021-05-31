import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loginpage/screens/gmailauth.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int start = 120;
  bool wait = false;
  String buttonName = "Send";
  //AuthClass authClass = AuthClass();
  TextEditingController phoneController = TextEditingController();
  String verificationIdFinal = "";
  String smscodefinal = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "SignIn",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
///////////////////////////////////   Continue with Phone    //////////////////////////////////////////
              Text(
                "Continue with Phone!",
                style: TextStyle(
                  fontSize: 33,
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
/////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 50,
              ),
////////////////////////////////       TextFormField    //////////////////////////////////////////////////////////
              textfiled(),
//////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
//////////////////////////////    Enter 6 digit OTP   //////////////////////////////////////////////////////////
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 1,
                          color: Colors.black,
                          margin: EdgeInsets.symmetric(horizontal: 12)),
                    ),
                    Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(
                          fontSize: 16.0, height: 1.0, color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
/////////////////////////////////////  OTPBox    //////////////////////////////////////////////////////////
              OtpBox(),
////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////    Send OTP again in 00:30 sec    //////////////////////////////////////////////////////////
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Send OTP again in ",
                      style:
                          TextStyle(fontSize: 16, color: Colors.blue.shade700),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
                    ),
                    TextSpan(
                      text: " sec ",
                      style:
                          TextStyle(fontSize: 16, color: Colors.blue.shade700),
                    ),
                  ],
                ),
              ),
//////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 30,
              ),
/////////////////////////////////////    Lets GO Button    //////////////////////////////////////////////////////////
              GoButton(),
/////////////////////////////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
////////////////////////////////////       TextFormField  FUNCTIONS       ////////////////////////////////////////////////
  //////// Add validation here

  Widget textfiled() {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade100,
      ),
      child: Card(
        elevation: 15.0,
        child: TextField(
          controller: phoneController,
          style: TextStyle(fontSize: 20.0, height: 1.0, color: Colors.black),
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter your phone number",
            counterText: "",
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
              child: Text(
                "(+91)",
                style: TextStyle(fontSize: 17),
              ),
            ),
            suffixIcon: InkWell(
              onTap: wait
                  ? null
                  : () async {
                      setState(() {
                        start = 120;
                        wait = true;
                        buttonName = "Resend";
                      });
                      await verifyPhoneNumber(
                          "+91 ${phoneController.text}", context);
                    },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                child: Text(
                  buttonName,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: wait ? Colors.grey.shade600 : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////       startTimer Function    //////////////////////////////////////////////////////////
  void startTimer() {
    print("--------------------->>>>>>>");
    //print(verficationId);

    print(verificationIdFinal);
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////    OTPBox Function    //////////////////////////////////////////////////////////
  Widget OtpBox() {
    final _pinPutController = TextEditingController();
    final _pinPutFocusNode = FocusNode();
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.green.shade100,
      // color: const Color.fromRGBO(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromRGBO(126, 203, 224, 1),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: PinPut(
        fieldsCount: 6,
        withCursor: true,
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
        eachFieldWidth: 53.0,
        eachFieldHeight: 55.0,
        onSubmit: (String pin) {
          print("Completed : " +
              pin +
              " verfication code: " +
              verificationIdFinal);
          setState(() {
            smscodefinal = pin;
          });
        },
        //_showSnackBar(pin)
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.fade,
      ),
    );
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// Lets GO Button   ///////////////////////////////////////
  Widget GoButton() {
    return InkWell(
      onTap: () {
        signInwithPhoneNumber(verificationIdFinal, smscodefinal, context);
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
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
          //color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Lets Go",
            style: TextStyle(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////
  /*void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }*/

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context) async {
    print(phoneNumber);
    //String verificationId = "";
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      print("Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      print(e);
    };
    PhoneCodeSent codeSent =
        (String verificationID, [int forceResnedingtoken]) {
      print("Verification Code sent on the phone number");

      setState(() {
        verificationIdFinal = verificationID;
      });
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      print("Time out");
      setState(() {
        verificationIdFinal = verificationID;
      });
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
}
