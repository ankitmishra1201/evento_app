import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'moreinfo.dart';
import 'moreinfobyeventorganiser.dart';


class EventGridtoLogistics extends StatefulWidget {
  String username;

  EventGridtoLogistics(@required this.username, );

  @override
  State<EventGridtoLogistics> createState() => _EventGridtoLogisticsState();
}


class _EventGridtoLogisticsState extends State<EventGridtoLogistics> {
  late String username = widget.username;


  var _postjson = [];

  void getdata() async {
    final url = "http://localhost:8080/geteventslogistic/" + username;
    var response = await get(Uri.parse(url));
    //print(response);
    final jsondata = jsonDecode(response.body) as List;


    setState(() {
      _postjson = jsondata;
    });

  }

  @override
  void initstate() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
      ),
      drawer: Drawer(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset('assets/evento_logo.jpg')),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.45,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: null,
                  child: Center(
                    child: Text(
                      "About Us",
                      style: TextStyle(color: Colors.grey[900], fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: null,
                  child: Center(
                    child: Text(
                      "Know Developers",
                      style: TextStyle(color: Colors.grey[900], fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                    child: Text(
                      "About Us",
                      style: TextStyle(color: Colors.grey[900], fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.separated(
                separatorBuilder:(BuildContext context, int index){
                  return SizedBox(height: 15 );
                } ,
                itemCount: _postjson.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
                    child: AutoSizeText(
                      "Hello " + "Tinku" + " !",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                      minFontSize: 30,
                      maxFontSize: 40,
                      maxLines: 1,
                    ),
                  )
                      : travelCard(
                      _postjson[index - 1]["name"],
                      _postjson[index - 1]["date_time"],
                      _postjson[index - 1]["price"],
                      _postjson[index - 1]["venue"],
                      _postjson[index - 1]["id"],
                      username.toString(),
                      context);
                }),
          )),

    );
  }
}

Widget travelCard(String name, String date, var price, String location,int id, String username, BuildContext context) {
  return Container(

    decoration: BoxDecoration(
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
    ),
    child: Card(

      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(60)
      ),
      child: Material(
        elevation: 6,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MoreInfo(id, username)));
          },
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset("assets/evento_logo.jpg", fit: BoxFit.fill),
              ),
              Container(
                color: Colors.grey[900],
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      name,
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w800,

                      ),
                      minFontSize: 25,
                      maxFontSize: 30,
                    ),
                    AutoSizeText(
                      "Rs "+price.toString()+" /-",
                      style:TextStyle(
                          color:Colors.white60,
                          fontWeight: FontWeight.w400
                      ),
                      minFontSize: 15,
                      maxFontSize: 25,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[900],
                padding: EdgeInsets.only(left: 10,right: 10,bottom: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.white70,),
                        AutoSizeText(
                          location,
                          style:TextStyle(
                            color:Colors.white70,
                            fontWeight: FontWeight.w400,

                          ),
                          minFontSize: 15,
                          maxFontSize: 20,
                        ),
                      ],
                    ),
                    AutoSizeText(
                      date,
                      style:TextStyle(
                          color:Colors.redAccent,
                          fontWeight: FontWeight.w400
                      ),
                      minFontSize: 15,
                      maxFontSize: 25,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}




