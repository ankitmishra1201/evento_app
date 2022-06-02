import 'dart:convert';

import 'package:dbms_mp/Transactions/AddPaymentDetailbyuser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoreInfo extends StatefulWidget {
  int id;
  String p_username;
  MoreInfo(@required this.id,@required this.p_username);


  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  late int id=widget.id;
  late String p_username=widget.p_username;

  var name;
  var date;
  var fin;
  var venue;
  var price;
  var minor;


  void fetchdata()async{


    try{
      final response=await get(Uri.parse("http://localhost:8080/geteventsbyid/"+id.toString()));
      final jsondata=jsonDecode(response.body);


      setState((){
        name=jsondata[0]['name'];
        date=jsondata[0]['date'];
        if(jsondata[0]['fin']==0){
          fin="Event Available";
        }
        else{
          fin="Event Finished";
        }
        venue=jsondata[0]['venue'];
        price=jsondata[0]['price'];
        if(jsondata[0]["minor"]==0){
          minor="Everyone Eligiblile";
        }
        else{
          minor="Only 18+ eligibile";
        }
      });



    }catch(err){
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchdata();
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Event name: "+name.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
            Text("Date: "+date.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Event Finished "+fin.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Venue: "+venue.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Price: "+price.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Eligibility: "+minor.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: MediaQuery.of(context).size.height*0.2),
              InkWell(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddpaymentByUser(id,p_username,price)));},
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
                      "PAY NOW",
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
