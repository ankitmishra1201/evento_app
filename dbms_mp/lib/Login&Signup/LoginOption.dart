import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbms_mp/EventInfo/EventGridtoLogistics.dart';
import 'package:dbms_mp/EventInfo/EventGridtoUser.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../EventInfo/EventGridtoOrganiser.dart';

class LoginOption extends StatefulWidget {
  const LoginOption({Key? key}) : super(key: key);

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();

    var url="http://localhost:8080/authenticate";

    void postdata() async{
      var dio=Dio();
      var data=jsonEncode({
        "username":username.text.toString(),
       // "password":password.text.toString(),
      });
      try {
        Response response = await dio.post(url, data: data);
        print(response.data);
        var detail=response.data as List;
        if(detail.isNotEmpty){
          if(detail[0]["role"]=="customer")
            (detail[0]["password"].toString()==password.text.toString())?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EventGridtoUser(username.text.toString()),fullscreenDialog: true)):ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Please Enter Correct Password"),
            ));
          else if(detail[0]["role"]=="organiser"){
            (detail[0]["password"].toString()==password.text.toString())?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EventGridtoOrganiser(username.text.toString()),fullscreenDialog: true)):ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Please Enter Correct Password"),
            ));
          }
          else if(detail[0]["role"]=="logistic"){
            (detail[0]["password"].toString()==password.text.toString())?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EventGridtoLogistics(username.text.toString()),fullscreenDialog: true)):ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Please Enter Correct Password"),
            ));
          }
          }


        else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("No Such Username Exist"),
          ));

        }
      }catch(error){
        print(error);
      }

    }


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
        child: Padding(
          padding: const EdgeInsets.only(top:12.0,left: 18.0,right: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText("Let's Sign You In..",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,

                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 40,
                  maxFontSize: 50,
                ),
              SizedBox(height: 20,),
              AutoSizeText("Welcome Back,\nYou have been missed!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,

                ),
                textAlign: TextAlign.left,
                minFontSize:30,
                maxFontSize: 40,
                maxLines: 2,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              TextField(
                controller: username,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Username",
                  alignLabelWithHint: true,
                  labelStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              TextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Password",
                  alignLabelWithHint: true,
                  labelStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forget Your Password?? ",style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),),
                  InkWell(
                    onTap: ()=>null,
                    child: Text("Let's Restore it!",style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 12,
                    ),),
                  )

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Center(
                child: InkWell(
                  onTap: ()=>postdata(),
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
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),



              //SizedBox(height: MediaQuery.of(context).size.height*0.35,),
              // InkWell(
              //   onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginbyuser()));},
              //   child: Container(
              //     height: MediaQuery
              //         .of(context)
              //         .size
              //         .height * 0.07,
              //     width: MediaQuery
              //         .of(context)
              //         .size
              //         .width * 0.8,
              //
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "LOGIN BY USER",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: MediaQuery
              //     .of(context)
              //     .size
              //     .height * 0.025,),
              // InkWell(
              //   onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginbyEvent()));},
              //   child: Container(
              //     height: MediaQuery
              //         .of(context)
              //         .size
              //         .height * 0.07,
              //     width: MediaQuery
              //         .of(context)
              //         .size
              //         .width * 0.8,
              //
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "LOGIN AS EVENT ORGANISER",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: MediaQuery
              //     .of(context)
              //     .size
              //     .height * 0.025,),
              // InkWell(
              //   onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginbyOrganiser()));},
              //   child: Container(
              //     height: MediaQuery
              //         .of(context)
              //         .size
              //         .height * 0.07,
              //     width: MediaQuery
              //         .of(context)
              //         .size
              //         .width * 0.8,
              //
              //     decoration: BoxDecoration(
              //       color: Colors.black,
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "LOGIN AS LOGISTIC",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
