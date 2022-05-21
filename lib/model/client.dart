import 'package:flutter/foundation.dart';

class Cliente{
int idCliente;
String nombre;
String carnetIdentidad;

Cliente({required this.idCliente,required this.carnetIdentidad,required this.nombre});

factory Cliente.fromJson(Map<String,dynamic>json){
  return Cliente(
    carnetIdentidad:json['carnetIdentidad'],
    nombre:json['nombre'],
    idCliente:json['idCliente']
    );
}

}