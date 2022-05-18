import 'package:flutter/material.dart';
class dropdown extends StatefulWidget {
  dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  String _dropdownvalue='Plaza';
  @override
  Widget build(BuildContext context) {
     return DropdownButton(
       hint: Text('Municipios'),
       onChanged: dropdowncallback,
       value: _dropdownvalue,
      isDense: true,
      isExpanded: true,
 iconSize: 42,
 iconEnabledColor: Colors.lightBlueAccent,
  items:[
    
  DropdownMenuItem<String> (child:Text('Plaza') ,value: 'Plaza',),
  DropdownMenuItem<String>  (child:Text('San miguel') ,value: 'San miguel',),
  DropdownMenuItem<String>  (child:Text('10 de Octubre') ,value: '10 de Octubre',),
  DropdownMenuItem<String>  (child:Text('Playa') ,value: 'Playa',),
  DropdownMenuItem<String>  (child:Text('Miramar') ,value: 'Miramar',),
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