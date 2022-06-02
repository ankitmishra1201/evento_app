import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class AddpaymentByUser extends StatefulWidget {
 int e_id;
 String p_username;
 int amount;
 AddpaymentByUser(@required this.e_id, @required this.p_username, @required this.amount);

  @override
  State<AddpaymentByUser> createState() => _AddpaymentByUserState();
}

class _AddpaymentByUserState extends State<AddpaymentByUser> {
  TextEditingController name=TextEditingController();
  TextEditingController accnum=TextEditingController();
  TextEditingController ifsc=TextEditingController();
  TextEditingController upiid=TextEditingController();
  TextEditingController mode=TextEditingController();

  var url="http://localhost:8080/banking/add";
  Random random = new Random();
  late int randomNumber =random.nextInt(10000);
  late int id=randomNumber;
  late int e_id=widget.e_id;
  void addtransactions ()async{

    var dio=Dio();
    var data=jsonEncode({
      "b_id":id,
      "name":name.text.toString(),
      "accnum":accnum.text,
      "ifsc":ifsc.text,
      "upi":upiid.text

    });
    try{
      Response response = await dio.post(url, data: data);
      print(response.data);

    }catch(err){
      print(err);
    }
  }
  var url2="http://localhost:8080/transactions/add";
  late int t_id=random.nextInt(10000);
late int amount=widget.amount;
  void addtransactiondetail()async{

    var dio=Dio();
    var data=jsonEncode({
      "id":t_id,
      "pmode":mode.text.toString(),
      "amount":amount

    });

    try{
      Response response=await dio.post(url2,data: data);
      print(response.data);
    }catch(err){
      print(err);
    }

  }

  late String p_username=p_username;
var url3="http://localhost:8080/registrations/add";
  void addregistrations() async{
    var dio=Dio();
    var data=jsonEncode({
      "p_username":p_username.toString(),
      "e_id":e_id,
      "t_id":t_id,
    });
    try {
      Response response=await dio.post(url3,data: data);
      print(response.data);

    }catch(err){
      print(err);
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,),
              Text("Add Event",
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
                controller: name,
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
                  labelText: "Bank Name",
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
                controller: accnum,
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
                  labelText: "Account Number",
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
                controller: ifsc,
                keyboardType: TextInputType.text,
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
                  labelText: "IFSC code",
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
                controller: upiid,
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
                  labelText: "UPI id",
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
                controller:mode ,
                keyboardType: TextInputType.text,
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
                  labelText: "MODE OF PAYMENT",
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
                onTap: (){
                  addtransactions();
                  addtransactiondetail();
                  addregistrations();
                  Navigator.of(context).pop();
                },
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
                      "Send Payment details",
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
