import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
void main() => runApp(ProductosPage());
class Productos{
  int id;
  String name;
  int price;
  String nutrient;
  String image;
  Productos(this.id, this.name, this.price, this.nutrient, this.image);
  Productos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    nutrient = json['nutrient'];
    image = json['image'];
  }
}
class ProductosPage extends StatefulWidget {
  @override
  _ProductosPageState createState() => _ProductosPageState();
}
class _ProductosPageState extends State<ProductosPage> {

  List<Productos> _productos = List<Productos>();
  Future<List<Productos>> fetchProductos() async {
    var url = "https://benefits-user-dot-yuyaytest.uc.r.appspot.com/v2/post/product";
    var response = await http.post(Uri.parse(url));

    var productos = List<Productos>();

    if (response.statusCode == 200) {
      var productosJson = json.decode(response.body);
      for(var productosJson in productosJson){
        productos.add(Productos.fromJson(productosJson));
      }
    }
    return productos;
  }
  @override
  void initState(){
    fetchProductos().then((value) {
      setState((){
      _productos.addAll(value);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              elevation:5,
              color: Colors.deepOrange[50],
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
                    Text(_productos[index].name, style:TextStyle(
                      fontSize:22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text(_productos[index].price.toString(), style:TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text(_productos[index].nutrient, style:TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text(_productos[index].image, style:TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              ),
                ),
            );
          },
    itemCount: _productos.length,
        ),
    );
    }
}