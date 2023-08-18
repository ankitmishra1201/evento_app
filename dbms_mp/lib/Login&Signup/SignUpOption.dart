import 'package:auto_size_text/auto_size_text.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.turn_left,size: 30,),
          onPressed:()=> Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 18.0,right: 18.0,top: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration:BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),

                      ) ,

                      height: 20,
                      width: MediaQuery.of(context).size.width/2.4,
                    ),

                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width/2.4,
                      decoration:BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      //color: Colors.grey[900],
                    ),
                    ),

                  ],),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                AutoSizeText(
                    "Hey There! Let's get you Registered.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,

                ),
                  minFontSize: 30,
                  maxFontSize: 40,
                  maxLines: 2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                AutoSizeText(
                  "Who Are You ??",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,

                  ),
                  minFontSize: 30,
                  maxFontSize: 40,
                  maxLines: 1,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.055,),

                //SizedBox(height: MediaQuery.of(context).size.height*0.35,),
                Center(
                  child: InkWell(
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Event Customer",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.025,),
                Center(
                  child: InkWell(
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Event Organiser",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.025,),
                Center(
                  child: InkWell(
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Event Logistic",
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 20,
                          ),
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
