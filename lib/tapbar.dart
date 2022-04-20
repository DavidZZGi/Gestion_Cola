import 'package:flutter/material.dart';
import 'listviewcomponent.dart';

class MyTapBar extends StatelessWidget {
  const MyTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black87,
          shadowColor: Colors.grey,
          brightness: Brightness.light,
          title:Center(child:const Text('TabBar Widget') ,) ,
          bottom:  TabBar(
            indicatorWeight: 8.0,
            indicatorColor: Colors.grey[850],
            tabs: <Widget>[
              Tab(
                text: 'Crear',
                icon: Icon(Icons.add_box_outlined),
              ),
              Tab(
                text: 'Tiendas',
                icon: Icon(Icons.store),
              ),
              Tab(
                text: 'Incidencias',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[

             Container(
               color: Colors.grey,
               padding: EdgeInsets.all(32.0),
               child: 
               Text('Crear',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15

               ),
               
               )
                 
               
               ),
               
            
            Center(
              child: Text("It's rainy here"),
            ),
            Container(
              padding: EdgeInsets.all(46.0),
              color: Colors.grey,
              child:  Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nombre Clientes',
                      style: TextStyle(
                         backgroundColor: Colors.grey,
                         fontSize: 15.0
              
                      ),
                      
                      
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white38,
                        child: MylistView()
                        
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}