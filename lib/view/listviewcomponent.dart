import 'package:flutter/material.dart';
import 'package:line_management/model/client.dart';
import 'package:line_management/provider/clientProvider.dart';
import 'package:provider/provider.dart';

class MylistView extends StatefulWidget {


  @override
  State<MylistView> createState() => _MylistViewState();
}

class _MylistViewState extends State<MylistView> {
  List<String>words=['juan','pedro','adrian','pepe','alain','jesus','marcelo'];
  


  @override
  Widget build(BuildContext context) {
    List<Cliente>clientes=Provider.of<ClienteProvider>(context , listen: true).inicializarClientesSinConexion();
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: clientes.length,
      itemBuilder: (context,i){
        final item=clientes[i];
           return 
                 Dismissible(
                    background: Container(
                      child: Center(child: Text('Eliminar',style: TextStyle(color: Colors.black,fontSize: 20),)),
                   color: Colors.red,
          ),
                   key: ValueKey<String>(item.nombre),
          onDismissed: (DismissDirection direction) {
            ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('${clientes[i].nombre}' '${clientes[i].apellidos} fue removido de la cola')));
            setState(() {
             Provider.of<ClienteProvider>(context,listen:true).removeCliente(clientes[i]);
             

            });
           
          },
          
                   child: Card(
                     color: Colors.transparent,
                     child: ListTile(
                      leading:Icon(Icons.person,
                      size:30,
                      color: Colors.black,
                      ),
                      title: Text(
                         'Cliente'+'$i',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.black45
                           
                         ),
                       ),
                       subtitle:Text(
                            '${clientes[i].nombre}'
                                  
                       ),
                     
                     ),
                   ),
                 );    
      } 
                 );
                    
           
            
  }
 

  
      
     

}

 

