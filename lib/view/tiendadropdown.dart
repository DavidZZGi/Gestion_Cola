import 'package:flutter/material.dart';
class TiendaDropdown extends StatefulWidget {
  TiendaDropdown({Key? key}) : super(key: key);

  @override
  State<TiendaDropdown> createState() => _TiendaDropdownState();
}

class _TiendaDropdownState extends State<TiendaDropdown> {
  String _dropdownvalue='Tiendas';
  @override
  Widget build(BuildContext context) {
   return DropdownButton(
     dropdownColor: Colors.blueAccent,
       hint: Text('Tiendas'),
       onChanged: dropdowncallback,
       value: _dropdownvalue,
      isDense: true,
      isExpanded: true,
 iconSize: 42,
 iconEnabledColor: Colors.lightBlueAccent,
  items:[
  DropdownMenuItem<String> (child:Text('Tiendas',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Tiendas',),
  DropdownMenuItem<String> (child:Text('Playa- Mercado 3ra y 8',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Playa- Mercado 3ra y 8',),
  DropdownMenuItem<String>  (child:Text('Plaza- Tulipan y 39',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Plaza- Tulipan y 39',),
  DropdownMenuItem<String>  (child:Text('Plaza- Kiosco Carmelo Fanguito, Calle 19 esq. 32',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Plaza- Kiosco Carmelo Fanguito, Calle 19 esq. 32',),
  DropdownMenuItem<String>  (child:Text('Plaza- Photoservi 23 y H',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Plaza- Photoservi 23 y H',),
  DropdownMenuItem<String>  (child:Text('Plaza- SC Zapata y 6, Zapata y 6',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,value: 'Plaza- SC Zapata y 6, Zapata y 6',),
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