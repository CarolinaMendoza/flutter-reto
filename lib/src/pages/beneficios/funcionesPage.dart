import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(FuncionesPage());
class Funciones{
  int id;
  String name;
  Funciones(this.id, this.name);
  Funciones.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}
class FuncionesPage extends StatefulWidget {
  @override
  _FuncionesPageState createState() => _FuncionesPageState();
}

class _FuncionesPageState extends State<FuncionesPage> {

  List<Funciones> _funciones = List<Funciones>();
  Future<List<Funciones>> fetchFunciones() async {
    var url = "https://benefits-user-dot-yuyaytest.uc.r.appspot.com/v2/get/functions";
    var response = await http.get(Uri.parse(url));

    var funciones = List<Funciones>();

    if (response.statusCode == 200) {
      var funcionesJson = json.decode(response.body);
      for(var funcionesJson in funcionesJson){
        funciones.add(Funciones.fromJson(funcionesJson));
      }
    }
    return funciones;
  }
  @override
  void initState(){
    fetchFunciones().then((value) {
      setState((){
      _funciones.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Funciones"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              elevation:5,
              color: Colors.deepPurple[100],
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
                child:InkWell(
                  onTap:(){   
                  } ,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left:16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_funciones[index].name, style:TextStyle(
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
          itemCount: _funciones.length,
        )
    );
  }
}

