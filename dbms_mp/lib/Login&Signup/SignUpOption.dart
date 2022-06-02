import 'package:dbms_mp/Login&Signup/SignUpbyLogistic.dart';
import 'package:dbms_mp/Login&Signup/signupbyevent.dart';
import 'package:dbms_mp/Login&Signup/signupbyuser.dart';
import 'package:flutter/material.dart';

class SignupOption extends StatefulWidget {
  const SignupOption({Key? key}) : super(key: key);

  @override
  State<SignupOption> createState() => _SignupOptionState();
}

class _SignupOptionState extends State<SignupOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.35,),
              InkWell(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpbyUser()));},
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
                      " SIGN UP AS USER",
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
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpbyEvent()));},
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
                      "SIGN UP EVENT ORGANISER",
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
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpbyLogistic()));},
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
                      "SIGN UP AS LOGISTIC",
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
    );
  }
}
