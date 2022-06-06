


import 'package:flutter/material.dart';
import 'package:line_management/view/loading.dart';
import './upscreen_part.dart';
import './tapbar.dart';
import 'lineform.dart';
import 'loggin.dart';

void main() {
  runApp(MaterialApp(
  initialRoute: '/loading',
    routes: {
      '/loading':(context)=>LoadingPage(),
      '/':(context)=>const SignUpScreen(),
      '/cubacola':(context)=>  MyApp(),
      '/lineform':(context)=> Lineform()
    },
    debugShowCheckedModeBanner: false
    ,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
           Scaffold(
                  appBar: AppBar(
                    title: Center(
                      child:Text('Sistema de Gestión de Colas'
                      ,style: 
                      TextStyle (
                        fontWeight:FontWeight.bold ,color: Colors.white54)
                      ,)
                       ,) 
                       ,
                    automaticallyImplyLeading: false,
                  ),
                  body: Column(children: [
                  Flexible(child:
            UpScreenPart()
            
            ) ,
                  
          
            Flexible(
              child: MyTapBar(), 
              flex: 3,
            ),
               
          
            
                ],));
          
      
      
      
       
  
  }
}



