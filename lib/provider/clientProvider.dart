import 'package:flutter/cupertino.dart';
import 'package:line_management/model/client.dart';
import 'package:line_management/services/clientServices.dart';
import 'package:line_management/services/localConnectionServices.dart';


class ClienteProvider with ChangeNotifier{
ConnectionServices _conn=ConnectionServices();  
 
ClienteService _clienteService=ClienteService();
List<Cliente>listacliente=[];
late Cliente aux;




void insertClient(Cliente cliente)async{
 await _conn.insertClient(cliente);
 notifyListeners();
}


ClienteProvider.init(){
  //loadClientes();
  inicializarClientesSinConexion();
}

List<Cliente> inicializarClientesSinConexion(){
Cliente cliente1=Cliente(idCliente: 1, carnetIdentidad: '98022108501', nombre: 'David', apellidos: 'Zequeira Zorrilla');
Cliente cliente2=Cliente(idCliente: 2, carnetIdentidad: '98035408501', nombre: 'Liset', apellidos: 'Montano Hernandez');
Cliente cliente3=Cliente(idCliente: 3, carnetIdentidad: '93221034401', nombre: 'Marcelo', apellidos: 'Zequeira Valdez');
Cliente cliente4=Cliente(idCliente: 4, carnetIdentidad: '98022108501', nombre: 'Marlene', apellidos: 'Zorrilla Varona');
Cliente cliente5=Cliente(idCliente: 5, carnetIdentidad: '98022108501', nombre: 'Marcel', apellidos: 'Zequeira Gomez');
listacliente.add(cliente1);
listacliente.add(cliente2);
listacliente.add(cliente3);
listacliente.add(cliente4);
listacliente.add(cliente5);
notifyListeners();
return listacliente;
}


Future<List<Cliente>> loadClientes ()async{
listacliente=await _clienteService.fetchAllClients();
notifyListeners();
return listacliente;
}

Future<Cliente> findCliente({int ? id})async{
 Cliente result=await _clienteService.fetchCliente(id);
  aux=Cliente(
    idCliente: result.idCliente,
     carnetIdentidad: result.carnetIdentidad,
      nombre: result.nombre,
      apellidos: result.apellidos,
    
      );
  print(aux);
  notifyListeners();
  return aux;
}

void addCliente(Cliente cliente){
Cliente newcliente= Cliente(idCliente: cliente.idCliente, carnetIdentidad: cliente.carnetIdentidad, nombre: cliente.nombre, apellidos: cliente.apellidos);
listacliente.add(newcliente);
notifyListeners();

}
void removeCliente(Cliente cliente){
listacliente.remove(cliente);
notifyListeners();

}

Cliente stringToCliente(String ? clienteS){
 String client=clienteS!.trim();
int posiscionNombre=client.indexOf('N:');
int posicionAppelido=client.indexOf('A:');
int posicionCI=client.indexOf('CI:');
int posicionFV=client.indexOf('FV:');

String nombreClient=client.substring(posiscionNombre+2,posicionAppelido);
String apellidosClient=client.substring(posicionAppelido+2,posicionCI);
String carnetIdnt=client.substring(posicionCI+3,posicionFV);


Cliente cliente =Cliente(idCliente: 1, carnetIdentidad: carnetIdnt, nombre: nombreClient, apellidos: apellidosClient);
listacliente.add(cliente);
notifyListeners();
return cliente;
}

ClienteProvider();
}