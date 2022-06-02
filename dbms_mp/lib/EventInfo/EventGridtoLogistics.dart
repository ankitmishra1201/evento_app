import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'moreinfobyeventorganiser.dart';


class EventGridtoLogistics extends StatefulWidget {
  String username;
  EventGridtoLogistics(@required this.username);

  @override
  State<EventGridtoLogistics> createState() => _EventGridtoLogisticsState();
}


class _EventGridtoLogisticsState extends State<EventGridtoLogistics> {
  late String username=widget.username;




  var _postjson=[];

  void getdata() async{
    final url="http://localhost:8080/geteventslogistic/"+username;
    var response=await get(Uri.parse(url));
    print(response);
    final jsondata=jsonDecode(response.body) as List;
    print(jsondata);

    setState((){
      _postjson=jsondata;
    });
    print(_postjson);

  }
  @override
  void initstate(){
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: GridView.builder(

                itemCount: _postjson.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context,int index){
                  var post=_postjson[index];

                  return GestureDetector(
                      child: new Container(

                        color: Colors.black54,
                        child: Center(
                          child: Text(
                            "Event\n "+ post["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                      ),
                      onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MoreInfotoOrganiser(post["id"])));}
                  );
                }
            ),
          )
      ),




    );
  }
}
