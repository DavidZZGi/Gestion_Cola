import 'package:flutter/cupertino.dart';
import 'package:line_management/model/client.dart';
import 'package:line_management/services/clientServices.dart';


class ClienteProvider with ChangeNotifier{
ClienteService _clienteService=ClienteService();
List<Cliente>listacliente=[];
late Cliente aux;

ClienteProvider.init(){
  loadClientes();
}

Future<List<Cliente>> loadClientes ()async{
listacliente=await _clienteService.fetchAllClients();
notifyListeners();
return listacliente;
}

Future<Cliente> findMypime({int ? id})async{
 Cliente result=await _clienteService.fetchCliente(id);
  aux=Cliente(
    idCliente: result.idCliente,
     carnetIdentidad: result.carnetIdentidad,
      nombre: result.nombre,
      apellidos: result.apellidos,
      direccion: result.direccion,
      );
  print(aux);
  notifyListeners();
  return aux;
}

ClienteProvider();
}