import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbms_mp/EventInfo/EventGridtoOrganiser.dart';
import 'package:dbms_mp/Login&Signup/privacy_policy.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpbyEvent extends StatefulWidget {
  const SignUpbyEvent({Key? key}) : super(key: key);

  @override
  State<SignUpbyEvent> createState() => _SignUpbyEventState();
}

class _SignUpbyEventState extends State<SignUpbyEvent> {
  @override
  Widget build(BuildContext context) {
    bool? _tandc=false;
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController email=TextEditingController();
    TextEditingController phoneno=TextEditingController();
    TextEditingController companyname=TextEditingController();

    var url="http://localhost:8080/eventuser/register";
    void postuserdata() async{
      var dio= Dio();
      var body=jsonEncode(
        {
          "username":username.text.toString(),
          "password":password.text.toString(),
          "cname":companyname.text.toString(),
          "email":email.text.toString(),
          "pnum":phoneno.text,
          "verified":0,
          "b_id":4373
        }
      );
      try{
        if(username.text.trim().isEmpty||email.text.trim().isEmpty||companyname.text.trim().isEmpty||email.text.trim().isEmpty||phoneno.text.trim().isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please fill all the Details!"),

          ));

        }
        else {
          Response response = await dio.post(url, data: body);
          print(response.data);
          if(response.statusCode==200) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    EventGridtoOrganiser(username.text.toString())));
          }
        }
      }catch(err){
        print(err);
      }


    }
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.turn_left,size: 30,),
            onPressed:()=> Navigator.of(context).pop(),
          ),
        ),
        body:SafeArea(
          child: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration:BoxDecoration(
                          color: Colors.white,
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),

                  AutoSizeText("Please Fill up the Details.....",
                    style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.w400,

                    ),
                    textAlign: TextAlign.left,
                    minFontSize: 30,
                    maxFontSize: 40,
                    maxLines: 1,

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
                      fontSize: 16,
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
                      fontSize: 16,
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  TextField(
                    controller: companyname,
                    keyboardType: TextInputType.name,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: "Company name",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
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
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: "Company Email",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
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
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: "Company Phone number",
                      alignLabelWithHint: true,
                      labelStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey,fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueGrey, width: 3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                    ),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),


                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.03,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(

                          checkColor: Colors.grey[900],
                          activeColor: Colors.blue,
                          tristate: false,
                          value: _tandc,
                          onChanged: (bool ?value){
                            setState(() {
                              _tandc=value!;
                              print(value);
                              print(_tandc);
                            });
                          }
                      ),
                      Text("I Accept the following ",style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      InkWell(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolicy())),
                        child: Text("Terms & Condition!",style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 12,
                        ),),
                      )

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Center(
                    child: InkWell(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up ",
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 25,
                                ),
                              ),
                              Icon(Icons.chevron_right,size: 30,color: Colors.grey[900],),
                            ],
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
