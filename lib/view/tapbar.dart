import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_management/view/tiendadropdown.dart';
import 'listviewcomponent.dart';
import 'mundropdown.dart';

class MyTapBar extends StatefulWidget {
  const MyTapBar({Key? key}) : super(key: key);

  @override
  _MyTapBarState createState() => _MyTapBarState();
}

class _MyTapBarState extends State<MyTapBar> {
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
          title: Center(
            child: Text(''),
          ),
          bottom: TabBar(
            indicatorWeight: 8.0,
            indicatorColor: Colors.grey[850],
            tabs: <Widget>[
              Tab(
                text: 'Colas',
                icon: Icon(Icons.add_box_outlined),
              ),
              Tab(
                text: 'Productos',
                icon: Icon(Icons.fastfood),
              ),
              Tab(
                text: 'Clientes',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //First tap item
            Container(
              color: Colors.lightBlue[200],
              padding: EdgeInsets.all(12.0),
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  createBox(
                      Text(
                        'La habana',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text('Provincia',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold
                      ),
                      
                      )
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  
                    containerGradiente(DropdownMun()),
                  SizedBox(
                    height: 10,
                  ),
                containerGradiente(TiendaDropdown()),
             SizedBox(
                    height: 10,
                  ),
              
                 
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                   onPressed: (){
                       Navigator.of(context).pushNamed('/lineform');
                   }, 
                   
                   child: Text('Crear Cola')
                   ),
               )


                ],
              ),
            ),
            //Second Tab item
            Container(
            
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text('Busca los productos',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
                    ,),
                  ),
                   App(),

              ],)
            




            ),
            //Third tab item
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.grey,
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nombre Clientes :',
                        style: TextStyle(
                            backgroundColor: Colors.grey, fontSize: 15.0,
                            fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                    Flexible(
                      child:
                          Container(color: Colors.white38, child: MylistView()),
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

  Widget createBox(name, subname) {
    return SizedBox(
        width: 300,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlue, Color.fromRGBO(14, 30, 50, 1.7)]),
          ),
          child: ListTile(
            title: subname,
            subtitle: name,
          ),
        ));
  }
Widget containerGradiente(Widget child){
  return Container(
                    padding: EdgeInsets.all(12.0),
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.lightBlue,
                              Color.fromRGBO(14, 30, 50, 1.7)
                            ]),
                      ),
                      child: child,
                      );
}
Widget containerNormal(Widget child){
  return Container(
                    padding: EdgeInsets.all(12.0),
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.lightBlue,
                              Color.fromRGBO(1, 35, 50, 1.2)
                            ]),
                      ),
                      child: child,
                      );
}




}
//Search Bar
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 180),
      child: Container(
        child: AnimSearchBar(
          width: 400,
          textController: textController,
          onSuffixTap: () {
            setState(() {
              textController.clear();
            });
          },
        ),
      ),
    );
  }
}
