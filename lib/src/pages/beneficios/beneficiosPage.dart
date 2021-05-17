import 'package:flutter/material.dart';

class BeneficiosPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beneficios'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(100),
        child: Center(
          child: Column(
            children: <Widget>[
              _crearCard1(context),
              _crearCard2(context),
              _crearCard3(context)
            ],
          )
          )
      ),
    );
  }
 Widget _crearCard1(BuildContext context) {
   return Card(
     elevation: 5,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20)),
       child:InkWell(
        onTap:(){
             Navigator.pushNamed(context,'productos');
        } ,
      child: Container(
        padding: EdgeInsets.all(20),
        child:Column(
          children: <Widget>[
            Text('Funciones', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ],
          ),
          ),
       ),
   );
 }
 Widget _crearCard2(BuildContext context) {
  
   return Card(
     elevation:5,
     color: Colors.deepOrange,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20)),
      child:InkWell(
        onTap:(){
           Navigator.pushNamed(context,'organos');  
        } ,
        child:Container(
        padding: EdgeInsets.all(26),
        child:Column(
          children: <Widget>[
            Text('Organos', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold, 
              fontSize: 20),),
            
          ],
          ),
          ),
      ),
   );
 }
 Widget _crearCard3(BuildContext context) {
   return Card(
     elevation:5,
     color: Colors.deepPurple,
     clipBehavior: Clip.hardEdge,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20)),
       child:InkWell(
        onTap:(){
             Navigator.pushNamed(context,'sistemas');
        } ,
      child: Container(
        padding: EdgeInsets.all(26),
        child:Column(
          children: <Widget>[
            Text('Sistemas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            
          ],
          ),
          ),
       ),
   );
 }
}