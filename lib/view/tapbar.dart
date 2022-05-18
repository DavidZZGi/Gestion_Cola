import 'package:flutter/material.dart';
import 'listviewcomponent.dart';
import 'mundropdown.dart';
class MyTapBar extends StatelessWidget {
  const MyTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blueGrey,
          shadowColor: Colors.grey,
          brightness: Brightness.dark,
          title:Center(child: Text('Menu') ,) ,
          bottom:  TabBar(
            indicatorWeight: 8.0,
            indicatorColor: Colors.grey[850],
            tabs: <Widget>[
              Tab(
                text: 'Crear',
                icon: Icon(Icons.add_box_outlined),
              ),
              Tab(
                text: 'Colas',
                icon: Icon(Icons.linear_scale_sharp),
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
               color: Colors.lightBlue[200],
               padding: EdgeInsets.all(12.0),
               child: 
                  ListView(
                    padding: EdgeInsets.all(8),
                     children: [
                             createBox(Text('La habana',style: TextStyle(fontSize: 30,color: Colors.black),), Text('Provincia')),
                              SizedBox(height: 10,) ,  

                                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                             begin: Alignment.centerLeft,
                             end:Alignment.centerRight,
                             colors: [
                                 
                                 Colors.lightBlue,
                                 Color.fromRGBO(14, 30, 50, 1.7)
                             ]
                          ),
                         
                        
                        ),
                    child: dropdown()
                    
                    ),
                    SizedBox(height: 10,)

                     ],

                                   ),
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


Widget createBox(name , subname){
  return SizedBox(
      width: 300,
      height: 100,

      child: Container(
        decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
           begin: Alignment.centerLeft,
           end:Alignment.centerRight,
           colors: [
               
               Colors.lightBlue,
               Color.fromRGBO(14, 30, 50, 1.7)
           ]
        ),
       
      
      ),
        child: ListTile(
         title: subname,
         subtitle: name,
        

        ),
      )
  );
}




 



}