import 'dart:convert';

import 'package:dbms_mp/EventInfo/EventGridtoOrganiser.dart';
import 'package:dbms_mp/EventInfo/moreinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EventGridtoUser extends StatefulWidget {
  String username;
  EventGridtoUser(@required this.username);


  @override
  State<EventGridtoUser> createState() => _EventGridtoUserState();
}






class _EventGridtoUserState extends State<EventGridtoUser> {
  final url="http://localhost:8080/showallevents";
  late String username=widget.username;
  var _postjson=[];

  void getdata() async{
    var response=await get(Uri.parse(url));
    final jsondata=jsonDecode(response.body) as List;

    setState((){
      _postjson=jsondata;
    });

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
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context,int index){
              var post=_postjson[index];
                  return GestureDetector(
                    child: new Container(
                      color: Colors.black54,
                      child: Center(
                        child: Text(
                          "Event\n"+ post["name"],
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ),
                    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MoreInfo(post['id'], username.toString())));}
                  );
              }
              ),
        )
        )

    );
  }
}
