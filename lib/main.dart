import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'fetch.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  var infos,infos1;
  Future getData() async{
    String myUrl="https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=751001&date=15-05-2021";
    var req = await http.get(myUrl);
    setState(() {
      infos = json.decode(req.body);
    });
    print(infos["centers"].length);
  }
  Future getData1() async{
    String myUrl1="https://api.rootnet.in/covid19-in/hospitals/beds";
    var req1 = await http.get(myUrl1);
    setState(() {
      infos1 = json.decode(req1.body);
    });
    print(infos1["data"]["regional"].length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SSerrwP"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView.builder(
                itemCount:infos==null?0:infos["centers"].length+10,
                itemBuilder: (context,index){
                  return Text("SSP",style: TextStyle(fontSize: 25),);
                },
              ),
            ),
          ),
          Container(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView.builder(
                itemCount:infos1==null?0:infos1["data"]["regional"].length,
                itemBuilder: (context,index){
                  return Text("SSP",style: TextStyle(fontSize: 25),);
                },
              ),
            ),
          ),
          RaisedButton(
            onPressed: (){
              getData();
            },
            child: Text("CLICK"),
          ),
          SizedBox(height: 10,),
          RaisedButton(
            onPressed: (){
              getData1();
            },
            child: Text("CLICK1"),
          ),
        ],
      ),
    );
  }
}
