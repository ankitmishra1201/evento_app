import 'package:dbms_mp/EventInfo/Addeventbyorganiser.dart';
import 'package:dbms_mp/EventInfo/moreinfo.dart';
import 'package:dbms_mp/EventInfo/moreinfobyeventorganiser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class EventGridtoOrganiser extends StatefulWidget {
  String username;
  EventGridtoOrganiser(@required this.username);

  @override
  State<EventGridtoOrganiser> createState() => _EventGridtoOrganiserState();
}

class _EventGridtoOrganiserState extends State<EventGridtoOrganiser> {
  late String username=widget.username;

  @override
  void initstate(){
    super.initState();
    getdata();
  }


  var _postjson=[];

  void getdata() async{
    final url="http://localhost:8080/getevents/"+username;
    var response=await get(Uri.parse(url));
    final jsondata=jsonDecode(response.body) as List;

    setState((){
      _postjson=jsondata;
    });
    print(_postjson);

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
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddEvent(username.toString())));},
          child: Text('+',style: TextStyle(color: Colors.white),),

    ),

    );
  }
}
