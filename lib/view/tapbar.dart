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
                text: 'Crear Cola',
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
                      Text(
                        'Provincia',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  containerGradiente(DropdownMun(), 'Seleccionar municipio'),
                  SizedBox(
                    height: 10,
                  ),
                  containerGradiente(TiendaDropdown(), 'Seleccionar tienda'),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/lineform');
                        },
                        child: Text('Crear Cola')),
                  )
                ],
              ),
            ),
            //Second Tab item
            Container(
                padding: EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Flexible(
                      child: Center(
                        child: Text(
                          'Busca los productos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    App(),
                  ],
                )),
            //Third tab item
            Container(
              child: MylistView(),
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

  Widget containerGradiente(Widget child, String text) {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.lightBlue, Color.fromRGBO(14, 30, 50, 1.7)]),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '$text',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        child
      ]),
    );
  }

  Widget containerNormal(Widget child) {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.lightBlue, Color.fromRGBO(1, 35, 50, 1.2)]),
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
          helpText: 'Buscar',
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
