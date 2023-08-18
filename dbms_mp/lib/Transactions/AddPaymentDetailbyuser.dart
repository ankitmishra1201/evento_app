import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class AddpaymentByUser extends StatefulWidget {
  int e_id;
  String p_username;
  int amount;
  AddpaymentByUser(
      @required this.e_id, @required this.p_username, @required this.amount);

  @override
  State<AddpaymentByUser> createState() => _AddpaymentByUserState();
}

class _AddpaymentByUserState extends State<AddpaymentByUser> {
  TextEditingController name = TextEditingController();
  TextEditingController accnum = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController upiid = TextEditingController();
  TextEditingController mode = TextEditingController();

  var url = "http://localhost:8080/banking/add";
  Random random = new Random();
  late int randomNumber = random.nextInt(10000);
  late int id = randomNumber;
  late int e_id = widget.e_id;
  void addtransactions() async {
    var dio = Dio();
    var data = jsonEncode({
      "b_id": id,
      "name": name.text.toString(),
      "accnum": accnum.text,
      "ifsc": ifsc.text,
      "upi": upiid.text
    });
    try {
      Response response = await dio.post(url, data: data);
      print(response.data);
    } catch (err) {
      print(err);
    }
  }

  var url2 = "http://localhost:8080/transactions/add";
  late int t_id = random.nextInt(10000);
  late int amount = widget.amount;
  void addtransactiondetail() async {
    var dio = Dio();
    var data = jsonEncode({
      "id": t_id,
      "pmode": mode.text.toString(),
      "amount": amount,
      "e_id": e_id,
      "card_no": accnum.text,
      "card_name": name.text.toString(),
      "cvv": ifsc.text

    });

    try {
      Response response = await dio.post(url2, data: data);
      print(response.data);
    } catch (err) {
      print(err);
    }
  }

  late String p_username = p_username;
  var url3 = "http://localhost:8080/registrations/add";
  void addregistrations() async {
    var dio = Dio();
    var data = jsonEncode({
      "p_username": p_username.toString(),
      "e_id": e_id,
      "t_id": t_id,
    });
    try {
      Response response = await dio.post(url3, data: data);
      print(response.data);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                AutoSizeText(
                  "Payment Gateway                ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                  minFontSize: 30,
                  maxFontSize: 40,
                  maxLines: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0,bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "Rs "+amount.toString()+" /-",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                        minFontSize: 20,
                        maxFontSize: 30,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  padding: EdgeInsets.all(20),

                  decoration:

                      BoxDecoration(borderRadius: BorderRadius.circular(40.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(.25),
                              blurRadius: 5.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                0.5, // Move to right 10  horizontally
                                0.5, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                      color:Colors.black
                      ),


                  width: MediaQuery.of(context).size.width*0.95,

                  child: Column(
                    children: [
                      TextField(
                        controller: accnum,
                        keyboardType: TextInputType.number,
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
                          labelText: "Card Number",
                          alignLabelWithHint: true,
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      TextField(
                        controller: name,
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
                          labelText: "Card Owner Name",
                          alignLabelWithHint: true,
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 3),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(

                              controller: mode,
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
                                labelText: "Payment Method",
                                alignLabelWithHint: true,
                                labelStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w600),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blueGrey, width: 3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),

                          Expanded(
                            child: TextField(
                              controller: ifsc,
                              keyboardType: TextInputType.number,
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
                                labelText: "Enter CVV",
                                alignLabelWithHint: true,
                                labelStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w600),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blueGrey, width: 3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                InkWell(
                  onTap: () {
                    addtransactions();
                    addtransactiondetail();
                    addregistrations();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Pay Now",
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
          ),
        ),
      ),
    );
  }
}

// TextField(
// controller: name,
// keyboardType: TextInputType.name,
// style: TextStyle(
// color: Colors.white,
// fontSize: 20,
// ),
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
// labelText: "Bank Name",
// alignLabelWithHint: true,
// labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
//
// ),
// ),
// SizedBox(height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.03,),
// TextField(
// controller: accnum,
// keyboardType: TextInputType.number,
// style: TextStyle(
// color: Colors.white,
// fontSize: 20,
// ),
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
// labelText: "Account Number",
// alignLabelWithHint: true,
// labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
//
// ),
// ),
// SizedBox(height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.03,),
// TextField(
// controller: ifsc,
// keyboardType: TextInputType.text,
// style: TextStyle(
// color: Colors.white,
// fontSize: 20,
// ),
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
// labelText: "IFSC code",
// alignLabelWithHint: true,
// labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
//
// ),
// ),
// SizedBox(height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.03,),
// TextField(
// controller: upiid,
// keyboardType: TextInputType.emailAddress,
// style: TextStyle(
// color: Colors.white,
// fontSize: 20,
// ),
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
// labelText: "UPI id",
// alignLabelWithHint: true,
// labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
//
// ),
// ),
// SizedBox(height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.03,),
// TextField(
// controller:mode ,
// keyboardType: TextInputType.text,
// style: TextStyle(
// color: Colors.white,
// fontSize: 20,
// ),
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
// labelText: "MODE OF PAYMENT",
// alignLabelWithHint: true,
// labelStyle: const TextStyle(fontSize: 24, color: Colors.blueGrey,fontWeight: FontWeight.w600),
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(
// color: Colors.blueGrey, width: 3),
// borderRadius: BorderRadius.circular(40.0),
// ),
//
// ),
// ),
// SizedBox(height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.03,),
