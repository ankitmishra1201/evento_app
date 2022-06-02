import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MoreInfotoOrganiser extends StatefulWidget {
  int id;
  MoreInfotoOrganiser(@required this.id);

  @override
  State<MoreInfotoOrganiser> createState() => _MoreInfotoOrganiserState();
}

class _MoreInfotoOrganiserState extends State<MoreInfotoOrganiser> {
  late int id=widget.id;

  var name;
  var date;
  var fin;
  var venue;
  var price;
  var minor;

  void fetchdata()async{
    print(id);
    try{
      final response=await get(Uri.parse("http://localhost:8080/geteventsbyid/"+id.toString()));
      final jsondata=jsonDecode(response.body);
      print(jsondata);

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
              Text(fin.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Venue: "+venue.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Price: "+price.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              Text("Eligibility: "+minor.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: MediaQuery.of(context).size.height*0.2),

            ],
          ),
        ),
      ),

    );
  }
}
