import 'package:flutter/material.dart';

class MylistView extends StatefulWidget {


  @override
  State<MylistView> createState() => _MylistViewState();
}

class _MylistViewState extends State<MylistView> {
  
  List<String>words=['juan','pedro','adrian','pepe','alain','jesus','marcelo'];
  @override
  Widget build(BuildContext context) {
    
    return CreateListView(10,Icon(Icons.shop));
 } 

  static Widget CreateListView(cant,icon){
    return ListView.builder(
      itemCount: cant,
      itemBuilder: (context,i){
           return SizedBox(
             height: 70,
             width: 70,
             child: Card(
         child:Column(children: [
             Expanded(
               child: ListTile(
                leading: icon,
                title: Text(
                   'Cliente'+'$i',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black45
                     
                   ),
                 ),
                 subtitle:Text(
                      'Cliente incidente'
             
                 ),
               ),
             )
          

         ],) ,

             ),
           );
           
      }
      
      );

   }

 


}