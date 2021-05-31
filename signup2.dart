import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp2 extends StatefulWidget {
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  var authc = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _cpwdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  //String name, email, password;
  //int phone;

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
///////////////////////////////////    Create your account     //////////////////////////////////////////
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 20,
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
/////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 20,
              ),
/////////////////////////////////////       TextFormField    //////////////////////////////////////////////////////////
              //textItem(_email, false, "Email Address.."),
              textItem(false, "Name...", _nameController),
              SizedBox(
                height: 10,
              ),
              textItem(false, "Phone Number...", _phoneController),
              SizedBox(
                height: 10,
              ),
              textItem(false, "Email Address...", _emailController),
              SizedBox(
                height: 10,
              ),
              textItem(true, "Password...", _pwdController),
              SizedBox(
                height: 10,
              ),
              textItem(true, "Confirm Password...", _cpwdController),
//////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
///////////////////////////////////   Get Started!   /////////////////////////////////////////////////////////
              SignupButton(),

/////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),
/////////////////////////////////      Terms and Policy    ////////////////////////////////////////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "By signing up, you agree to Canva's Terms of Use and Privacy Policy.",
                  //overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
/////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 0,
              ),
//////////////////////////////////  Login   /////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already signed up?  ",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Text(
                      "Login",
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
            ],
          ),
        ),
      ),
    );
  }

  ////////////////////////////////////       TextFormField  FUNCTIONS       ////////////////////////////////////////////////
  //////// Add validation here
  Widget textItem(
      bool obscureText, String labeltext, TextEditingController controller) {
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
          controller: controller,
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
      ),
    );
  }

  ////////////////////////////////////     SignupButton    FUNCTIONS       ////////////////////////////////////////////////
  Widget SignupButton() {
    return InkWell(
      onTap: () async {
        try {
          print("test1.............");
          var user = await authc.createUserWithEmailAndPassword(
            /*email: "tttt@gmail.com",
            password: "12345678",*/
            email: _emailController.text,
            password: _pwdController.text,
          );
          print("test2...");
          print(user.user.email);

          print(user);

          if (user.additionalUserInfo.isNewUser == true) {
            print("done");

            /*var currentUser = FirebaseAuth.instance.currentUser;
            await currentUser.updateProfile(displayName: "Rinkle3");
            await currentUser.reload();
            currentUser = await FirebaseAuth.instance.currentUser;*/

            /*UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
  userUpdateInfo.displayName = name;
  userUpdateInfo.photoUrl = url;

  user.updateProfile(userUpdateInfo);


            await authc.currentUser.updateProfile(displayName: "Rinkle3");
            //_nameController.text
            //await authc.currentUser.reload();
            print("test3...");
            authc.currentUser.displayName;
            print("test4...");
            //UserUpdateInfo updateUser = UserInfo(_data);
            //Navigator.pushNamed(context, "chat");*/
          }
        } catch (e) {
          print(e);
        }
      }, // Add function and snackbar
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
            "Get Started!",
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
