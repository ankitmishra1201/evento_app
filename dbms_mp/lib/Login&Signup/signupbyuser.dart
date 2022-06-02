import 'dart:convert';

import 'package:dbms_mp/EventInfo/EventGridtoUser.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class SignUpbyUser extends StatefulWidget {
  const SignUpbyUser({Key? key}) : super(key: key);

  @override
  State<SignUpbyUser> createState() => _SignUpbyUserState();
}

class _SignUpbyUserState extends State<SignUpbyUser> {
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phoneno=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController address=TextEditingController();


  var url="http://localhost:8080/addprofile";
  void postuserdata() async{
    var dio= Dio();
    var body=jsonEncode({
      "username": username.text.toString(),
      "password": password.text.toString(),
      "fname": firstname.text.toString(),
      "lname": lastname.text.toString(),
      "age": age.text,

      "pnum": phoneno.text,

      "email": email.text,
      "gender": gender.text,
      "address": address.text,
      "b_id": 123456,
    });
    try{
      Response response=await dio.post(url,data: body);
      print(response);
    }catch(err){
      print(err);
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EventGridtoUser(username.text.toString())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body:SafeArea(
        child: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,),
                  Text("EVENTO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    )
                    ,),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: firstname,
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
                      labelText: "First Name",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: lastname,
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
                      labelText: "Last Name",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: password,
                    keyboardType: TextInputType.name,
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
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
                      labelText: "Email",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: phoneno,
                    keyboardType: TextInputType.phone,
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
                      labelText: "Phone number",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: gender,
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
                      labelText: "Gender",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: age,
                    keyboardType: TextInputType.number,
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
                      labelText: "Age",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: address,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
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
                      labelText: "Address",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(40.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  InkWell(
                    onTap: ()=>postuserdata(),
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
                          "Sign Up",
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
      )
    );
  }
}
