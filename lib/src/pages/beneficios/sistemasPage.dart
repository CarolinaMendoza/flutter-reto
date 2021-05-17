import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(SistemasPage());
class Sistemas{
  int id;
  String name;
  Sistemas(this.id, this.name);
  Sistemas.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}
class SistemasPage extends StatefulWidget {
  @override
  _SistemasPageState createState() => _SistemasPageState();
}

class _SistemasPageState extends State<SistemasPage> {

  List<Sistemas> _sistemas = List<Sistemas>();
  Future<List<Sistemas>> fetchSistemas() async {
    var url = "https://benefits-user-dot-yuyaytest.uc.r.appspot.com/v2/get/system";
    var response = await http.get(Uri.parse(url));

    var sistemas = List<Sistemas>();

    if (response.statusCode == 200) {
      var sistemasJson = json.decode(response.body);
      for(var sistemasJson in sistemasJson){
        sistemas.add(Sistemas.fromJson(sistemasJson));
      }
    }
    return sistemas;
  }
  @override
  void initState(){
    fetchSistemas().then((value) {
      setState((){
      _sistemas.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Sistemas"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              elevation:5,
              color: Colors.lightBlue[100],
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
                    Text(_sistemas[index].name, style:TextStyle(
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
          itemCount: _sistemas.length,
        )
    );
  }
}



