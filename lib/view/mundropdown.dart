import 'package:flutter/material.dart';
class DropdownMun extends StatefulWidget {
  DropdownMun({Key? key}) : super(key: key);

  @override
  State<DropdownMun> createState() => _DropdownMunState();
}

class _DropdownMunState extends State<DropdownMun> {
  String _dropdownvalue='Plaza';
  @override
  Widget build(BuildContext context) {
     return DropdownButton(
       hint: Text('Municipios'),
       dropdownColor: Colors.blueAccent,
       onChanged: dropdowncallback,
       value: _dropdownvalue,
      isDense: true,
      isExpanded: true,
 iconSize: 42,
 iconEnabledColor: Colors.lightBlueAccent,
  items:[
  DropdownMenuItem<String> (child:Text('Plaza',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Plaza',),
  DropdownMenuItem<String>  (child:Text('San miguel',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'San miguel',),
  DropdownMenuItem<String>  (child:Text('10 de Octubre',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: '10 de Octubre',),
  DropdownMenuItem<String>  (child:Text('Playa',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Playa',),
  DropdownMenuItem<String>  (child:Text('Miramar',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Miramar',),
  ]
  
  );



  }

 void dropdowncallback(String ? selected ){

   if(selected is String){
 setState(() {
  _dropdownvalue =selected;
 });
   }
 }



}