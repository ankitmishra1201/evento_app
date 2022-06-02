import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AddEvent extends StatefulWidget {
  String username;
  AddEvent(@required this.username);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController id=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController fin=TextEditingController();
  TextEditingController venue=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController minor=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController o_username=TextEditingController();
  @override
  Widget build(BuildContext context) {
    late String username=widget.username;
    var url="http://localhost:8080/addevents";
    var dio= Dio();
    void postevent() async{
      var data=jsonEncode({
        "id":id.text,
        "name":name.text.toString(),
        "date":date.text.toString(),
        "fin":fin.text,
        "venue":venue.text.toString(),
        "price": price.text,
        "minor": minor.text,
        "description":description.text.toString(),
        "o_username":username.toString(),

      });
      try {
        Response response = await dio.post(url, data: data);
        print(response.data);
      }catch(err){
        print(err);
      }
      Navigator.of(context).pop();


    }

    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body:SafeArea(
          child: SingleChildScrollView(

            child: Padding(
              padding: EdgeInsets.all(20),
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
                    controller: id,
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
                      labelText: "id",
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
                      labelText: " Name",
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
                    controller: date,
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
                      labelText: "Date(YYYY-MM-DD)",
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
                    controller: fin,
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
                      labelText: "Event Finished",
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
                    controller: venue,
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
                      labelText: "Venue",
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
                    controller: price,
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
                      labelText: "Price",
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
                    controller: minor,
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
                      labelText: "Minor",
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
                    controller: description,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
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
                      labelText: "Description",
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
                    onTap: ()=>postevent(),
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
                          "Add Event",
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
        )
    );
  }
}
