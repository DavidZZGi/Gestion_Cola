
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_management/model/Product.dart';
import 'package:line_management/provider/munprovider.dart';
import 'package:line_management/provider/productProvider.dart';
import 'package:line_management/provider/shopProvider.dart';
import 'package:provider/provider.dart';
import 'listviewcomponent.dart';
import 'mundropdown.dart';

class MyTapBar extends StatefulWidget {
  const MyTapBar({Key? key}) : super(key: key);

  @override
  _MyTapBarState createState() => _MyTapBarState();
}

class _MyTapBarState extends State<MyTapBar> {
  bool munSelected = false;
  bool tiendaSelected = false;
  late Future<List> shops;
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
                text: 'Crear Nueva Cola',
                icon: Icon(Icons.add_box_outlined),
              ),
              Tab(
                text: 'Productos',
                icon: Icon(Icons.fastfood),
              ),
              Tab(
                text: 'Colas',
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
                  shopsListView(),
                  // containerGradiente(TiendaDropdown(), 'Seleccionar tienda'),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          munSelected = Provider.of<MunicipioProvider>(context,
                                  listen: false)
                              .selectedValue;
                          if (munSelected)
                            Navigator.of(context).pushNamed('/lineform');
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Tiene que selecionar un municipio')));
                          }
                        },
                        child: Text('Crear Cola')),
                  )
                ],
              ),
            ),
            //Second Tab item
            Container(
              child:  Flexible(child: Home()),
              ),
            //Third tab item
            Container(
              child: MylistView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget shopsListView() {
    return FutureBuilder<List>(
        future: shops,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return getCard(snapshot.data![i]);
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        });
  }

  Widget getCard(index) {
    var id = index['id'];
    var nombre = index['nombre'];
    var idMun = index['id_municipio'];
    var activa = index['activa'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(60 / 2)),
              ),
              SizedBox(width: 20.0),
              Column(
                children: [
                  Text(
                    id.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(nombre.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text(idMun.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text(activa.toString()),
                ],
              )
            ],
          ),
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

  @override
  void initState() {
    super.initState();
    shops = Provider.of<ShopProvider>(context, listen: false).allShopsFromPlY();
    print(shops);
  }
}

//Search Bar
class ProductSearchBar extends StatefulWidget {
  @override
  _ProductSearchBarState createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
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

class Home extends StatefulWidget {
  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _HomeState createState() => _HomeState();
}

//Our Home state, the logic and internal state for a StatefulWidget.
class _HomeState extends State<Home> {
  //A controller for an editable text field.
  //Whenever the user modifies a text field with an associated
  //TextEditingController, the text field updates value and the
  //controller notifies its listeners.
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";
 late Future <List<Product>>products;
  List<String> _nebulae=[];
  List<String> _filterList=[];

  @override
  void initState() {
    super.initState();
 products=Provider.of<ProductProvider>(context,listen:false).getAllProducts();
 print(products);
    _nebulae = [];
   
    _nebulae = [
      "Orion",
      "Boomerang",
      "Cat's Eye",
      "Pelican",
      "Ghost Head",
      "Witch Head",
      "Snake",
      "Ant",
      "Bernad 68",
      "Flame",
      "Eagle",
      "Horse Head",
      "Elephant's Trunk",
      "Butterfly"
    ];
    
    _nebulae.sort();
  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          children: <Widget>[
           _createSearchView(),
            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      );
  
  }
 //Create a SearchView
  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: TextField(
        controller: _searchview,
        decoration: InputDecoration(
          hintText: "Agrege los productos de la cola",
          hintStyle:  TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  //Create a ListView widget
  Widget _createListView() {
    return  FutureBuilder<List<Product>>(
      future: products,
      builder: (contex,snapshot){
          if(snapshot.hasData){
            return  Flexible(
        child:  ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.lightBlue[100],
                elevation: 5.0,
                child:  Container(
                  margin: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     // Text("${_nebulae[index]}",
                     Text('${snapshot.data![index].productName}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
    
                      ),
                      
                      
                      ),
                      ElevatedButton(
                        onPressed: (){},
                         child: Text('Agregar',
                         style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
    
                      )
                         
                         
                         ))
                    ],
                  ),
                ),
              );
            }),
      );
           }
    else if(snapshot.hasError){
         return Text("${snapshot.error}");
    }    
    return CircularProgressIndicator(); 
     
    
   } );
  }
  
  //Perform actual search
  Widget _performSearch() {
    List<String>nombreProductos=Provider.of<ProductProvider>(context).products.map((e) => e.productName).toList();
    _filterList = [];
    for (int i = 0; i < nombreProductos.length; i++) {
      var item = nombreProductos[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }
  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return  Flexible(
      child:  ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.lightBlue[100],
              elevation: 5.0,
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${_filterList[index]}",
                    style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
    
                          )
                    
                    
                    ),
                     ElevatedButton(
                        onPressed: (){},
                         child: Text('Agregar',
                         style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
    
                      )
                         
                         
                         ))

                  ],
                ),
              ),
            );
          }),
    );
  }
}
