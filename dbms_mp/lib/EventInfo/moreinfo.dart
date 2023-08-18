import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
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
  var description;


  void fetchdata()async{


    try{
      final response=await get(Uri.parse("http://localhost:8080/geteventsbyid/"+id.toString()));
      final jsondata=jsonDecode(response.body);


      setState((){
        name=jsondata[0]['name'];
        date=jsondata[0]['date'];
        description=jsondata[0]['description'];
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
          minor="18+ eligibile";
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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.turn_left,size: 30,),
          onPressed:()=> Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.275,
                child: Image.asset("assets/evento_logo.jpg",fit: BoxFit.fill,),
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  AutoSizeText(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,

                    ),
                    textAlign: TextAlign.left,
                    minFontSize: 30,
                    maxFontSize: 40,
                  ),
                  AutoSizeText("Rs " + price.toString() + " /-",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w900,

                    ),
                    textAlign: TextAlign.left,
                    minFontSize: 20,
                    maxFontSize: 30,
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white70,
                      ),
                      AutoSizeText(
                        venue.toString(),
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                        minFontSize: 15,
                        maxFontSize: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white70,
                      ),
                      AutoSizeText(
                        date.toString(),
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                        minFontSize: 15,
                        maxFontSize: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white70,
                      ),
                      AutoSizeText(
                        minor.toString(),
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                        minFontSize: 15,
                        maxFontSize: 20,
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              child: Padding(
                  padding: EdgeInsets.all(20),
                child: AutoSizeText(
                  description.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  minFontSize: 20,
                  maxFontSize: 30,
                ),

              ),
            ),

            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.75,
                height: MediaQuery.of(context).size.height*0.065,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  color: Colors.redAccent,
                ),

                child: GestureDetector(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddpaymentByUser(id, p_username, price))),
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
