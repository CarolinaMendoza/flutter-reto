import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(OrganosPage());
class Organos{
  int id;
  String name;
  Organos(this.id, this.name);
  Organos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}
class OrganosPage extends StatefulWidget {
  @override
  _OrganosPageState createState() => _OrganosPageState();
}

class _OrganosPageState extends State<OrganosPage> {

  List<Organos> _organos = List<Organos>();
  Future<List<Organos>> fetchOrganos() async {
    var url = "https://benefits-user-dot-yuyaytest.uc.r.appspot.com/v2/get/organs";
    var response = await http.get(Uri.parse(url));

    var organos = List<Organos>();

    if (response.statusCode == 200) {
      var organosJson = json.decode(response.body);
      for(var organosJson in organosJson){
        organos.add(Organos.fromJson(organosJson));
      }
    }
    return organos;
  }
  @override
  void initState(){
    fetchOrganos().then((value) {
      setState((){
      _organos.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Organos"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              elevation:5,
              color: Colors.deepOrange[50],
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
                child:InkWell(
                  onTap:(){   
                  } ,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left:16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_organos[index].name, style:TextStyle(
                      fontSize:22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              ),
                ),
            );
          },
          itemCount: _organos.length,
        )
    );
  }
}



