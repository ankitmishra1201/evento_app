import 'package:dbms_mp/Login&Signup/LoginOption.dart';
import 'package:dbms_mp/Login&Signup/SignUpOption.dart';
import 'package:dbms_mp/Login&Signup/SignUpbyLogistic.dart';
import 'package:dbms_mp/Login&Signup/loginbyuser.dart';
import 'package:dbms_mp/Login&Signup/signupbyevent.dart';
import 'package:dbms_mp/Login&Signup/signupbyuser.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginEntry extends StatelessWidget {
  const LoginEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,),
                Text("EVENTO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  )
                  ,),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,),
                InkWell(
                  onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginOption()));},
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.07,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.025,),
                InkWell(
                  onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupOption()));},
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.07,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],

            ),
          ),
        ),
      ),
    );
  }

    }
