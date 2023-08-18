import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbms_mp/Login&Signup/LoginOption.dart';
import 'package:dbms_mp/Login&Signup/SignUpOption.dart';
import 'package:dbms_mp/Login&Signup/SignUpbyLogistic.dart';

import 'package:dbms_mp/Login&Signup/signupbyevent.dart';
import 'package:dbms_mp/Login&Signup/signupbyuser.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginEntry extends StatefulWidget{
  const LoginEntry({Key? key}) : super(key: key);

  @override
  State<LoginEntry> createState() => _LoginEntryState();
}

class _LoginEntryState extends State<LoginEntry> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController=new AnimationController(
        vsync: this,
      duration: new Duration(seconds: 7),
    );
    _animationController.repeat();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.45,
                  child: AnimatedBuilder(
                    builder: (BuildContext context,Widget? _widget){
                      return new Transform.rotate(
                          angle: _animationController.value*6.3,
                        child:_widget,
                      );

                    },
                    animation: _animationController,
                    child: Image(
                      image: AssetImage('assets/evento_logo.jpg'),
                    ),
                  ),
                ),
               AutoSizeText("EVENTO",
               style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.w900,
               ),
                 textAlign: TextAlign.center,
                 minFontSize: 32,
                 maxFontSize: 40,
                 maxLines: 1,
               ),
               SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: const AutoSizeText(
                      'The Platform that allows to connect Customers, Organisers and Logistic team without any intermidiate Hassle Lorem Ipsum blah blah blah meow meow meow ha ha ha ha ha  ',
                    style: TextStyle(
                        color: Colors.white60,
                      fontWeight: FontWeight.w700,

                    ),
                    textAlign: TextAlign.justify,
                    minFontSize: 15,
                    maxFontSize: 20,
                    maxLines: 4,

                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginOption()));},
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.07,
                        width: MediaQuery.of(context).size.width*0.4,


                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                          )

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

                    InkWell(
                      onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupOption()));},
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.07,
                        width: MediaQuery.of(context).size.width*0.4,


                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)
                          )

                        ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03,),
                Center(
                  child:AutoSizeText(
                    '2023 \u00a9 Ankit Mishra, Shwetabh Saxena, Soham Sonaiya',
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.w700,

                    ),
                    textAlign: TextAlign.justify,
                    minFontSize: 8,
                    maxFontSize: 10,
                    maxLines: 4,

                  ),
                )//fuck off

              ],

            ),
          ),
        ),
      ),
    );
  }
}
