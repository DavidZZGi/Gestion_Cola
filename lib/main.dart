import 'package:flutter/material.dart';
import 'package:line_management/upscreen_part.dart';
import 'listviewcomponent.dart';
import './tapbar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        
        body: Column(children: [
        Flexible(child:
          UpScreenPart()
          
          ) ,
        

          Flexible(
            child: MyTapBar(), 
            flex: 3,
          ),
     

          
      ],),)
      
      
      
       
    );
  }
}



