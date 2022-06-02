import 'package:dbms_mp/Login&Signup/LoginbyOrganiser.dart';
import 'package:dbms_mp/Login&Signup/loginbyevent.dart';
import 'package:dbms_mp/Login&Signup/loginbyuser.dart';
import 'package:flutter/material.dart';

class LoginOption extends StatefulWidget {
  const LoginOption({Key? key}) : super(key: key);

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
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
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginbyuser()));},
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
                      "LOGIN BY USER",
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
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginbyEvent()));},
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
                      "LOGIN AS EVENT ORGANISER",
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
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginbyOrganiser()));},
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
                      "LOGIN AS LOGISTIC",
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
