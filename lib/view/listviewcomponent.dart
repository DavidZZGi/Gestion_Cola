import 'package:flutter/material.dart';

class MylistView extends StatefulWidget {


  @override
  State<MylistView> createState() => _MylistViewState();
}

class _MylistViewState extends State<MylistView> {
  List<String>words=['juan','pedro','adrian','pepe','alain','jesus','marcelo'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: words.length,
      itemBuilder: (context,i){
        final item=words[i];
           return 
                 Dismissible(
                    background: Container(
                      child: Center(child: Text('Eliminar',style: TextStyle(color: Colors.black,fontSize: 20),)),
                   color: Colors.red,
          ),
                   key: ValueKey<String>(item),
          onDismissed: (DismissDirection direction) {
            setState(() {
              words.removeAt(i);
            });
           ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('${words[i]} dismissed')));
          },
          
                   child: Card(
                     color: Colors.transparent,
                     child: ListTile(
                      leading:Icon(Icons.shop),
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
                   ),
                 );    
      } 
                 );
                    
           
            
  }
 

  
      
     

}

 

