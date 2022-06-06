import 'package:flutter/foundation.dart';

class Cliente{
int idCliente;
String nombre;
String apellidos;
String carnetIdentidad;
String direccion; 

Cliente({required this.idCliente,required this.carnetIdentidad,required this.nombre, required this.apellidos,required this.direccion});

factory Cliente.fromJson(Map<String,dynamic>json){
  return Cliente(
    carnetIdentidad:json['carnetIdentidad'],
    nombre:json['nombre'],
    idCliente:json['idCliente'],
    apellidos:json['apellidos'],
    direccion:json['direccion']
    );
}

}