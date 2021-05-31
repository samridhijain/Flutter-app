import 'package:flutter/material.dart';
import 'package:loginpage/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatelessWidget {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    fillColor: Colors.green.shade100,
                    filled: true,
                    hoverColor: Colors.green,
                    hintText: "Your Email",
                    icon: Icon(
                      Icons.person,
                      color: Colors.green.shade900,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.green.shade100,
                    filled: true,
                    hoverColor: Colors.green,
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.green.shade900,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.green.shade900,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                width: size.width * 0.6,
                margin: EdgeInsets.only(left: 45.0),
                //color: Colors.amberAccent,
                child: Material(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        var user = await authc.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        print(email);
                        print(password);
                        print(user);

                        if (user.additionalUserInfo.isNewUser == true) {
                          print("done");
                          // authc.currentUser.updateProfile()
                          //UserUpdateInfo updateUser = UserInfo(_data)
                          //Navigator.pushNamed(context, "chat");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 2,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                        height: 2,
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                          height: 2,
                          fontSize: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.80,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.green,
                        height: 1.5,
                      ),
                    ),
                    Text(" OR "),
                    Expanded(
                      child: Divider(
                        color: Colors.green,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      //height: size.height * 0.2,
                      child: Icon(
                        Icons.alarm,
                        color: Colors.green.shade900,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      //height: size.height * 0.2,
                      child: Icon(
                        Icons.lock,
                        color: Colors.green.shade900,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      //height: size.height * 0.2,
                      child: Icon(
                        Icons.perm_camera_mic,
                        color: Colors.green.shade900,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
