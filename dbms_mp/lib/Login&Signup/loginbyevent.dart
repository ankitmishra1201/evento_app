import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../EventInfo/EventGridtoOrganiser.dart';

class LoginbyEvent extends StatefulWidget {
  const LoginbyEvent({Key? key}) : super(key: key);

  @override
  State<LoginbyEvent> createState() => _LoginbyEventState();
}

class _LoginbyEventState extends State<LoginbyEvent> {
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  var url="http://localhost:8080/eventuser/login";

  void postdata() async{
    var dio=Dio();
    var data=jsonEncode({
      "username":username.text.toString(),
      "password":password.text.toString(),
    });
    try {
      Response response = await dio.post(url, data: data);
      print(response.data);
      var detail=response.data as List;
      if(detail.isNotEmpty){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EventGridtoOrganiser(username.text.toString())));

      }
    }catch(error){
      print(error);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2,),
                  Text("EVENTO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    )
                    ,),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,),

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
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      labelText: "Username",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
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
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      labelText: "Password",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  InkWell(
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



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
