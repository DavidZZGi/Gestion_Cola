import 'package:flutter/material.dart';
import 'package:line_management/model/municipio.dart';
import 'package:line_management/services/municipioService.dart';

class MunicipioProvider with ChangeNotifier{
  List<Municipio>municipios=[];
  MunicipioService munipioService=MunicipioService();
 bool selectedValue=false;
 int idActive=2301;
MunicipioProvider.init(){
  inicializarMunicipiosSinConexion();
}

bool munWasSelected(){
selectedValue=true;
notifyListeners();
return selectedValue;
}





int idNomMun(String name){
for (var item in municipios) {
   if(item.nombre==name){
    idActive=item.idMunicipio;
   }
}
notifyListeners();
return idActive;

}





/*
Future<List<Municipio>>IncializarConConexion(){

}
*/

List<Municipio>inicializarMunicipiosSinConexion(){
Municipio mun1=Municipio(idMunicipio: 2301, nombre: "Playa", poblacion: 178557,nombreCorto: 'PYA');
Municipio mun2=Municipio(idMunicipio: 2302, nombre: "Plaza de la Revolución", poblacion: 141781,nombreCorto: 'PZA');
Municipio mun3=Municipio(idMunicipio: 2303, nombre: "Centro Habana", poblacion: 138898,nombreCorto: 'CHA');
Municipio mun4=Municipio(idMunicipio: 2304, nombre: "La Habana Vieja", poblacion: 81313,nombreCorto: 'LHV');
Municipio mun5=Municipio(idMunicipio: 2305, nombre: "La Habana del Este", poblacion: 174807,nombreCorto: 'LHE');
Municipio mun6=Municipio(idMunicipio: 2306, nombre: "Guanabacoa", poblacion: 125702,nombreCorto: 'GUA');
Municipio mun7=Municipio(idMunicipio: 2307, nombre: "San Miguel del Padrón", poblacion: 158022,nombreCorto: 'SMP');
Municipio mun8=Municipio(idMunicipio: 2308, nombre: "Diez de Octubre", poblacion: 201435,nombreCorto: 'DOC');
Municipio mun9=Municipio(idMunicipio: 2309, nombre: "Cerro", poblacion: 124646,nombreCorto: 'CER');
Municipio mun10=Municipio(idMunicipio: 2310, nombre: "Marianao", poblacion: 134994,nombreCorto: 'MAR');
Municipio mun11=Municipio(idMunicipio: 2311, nombre: "La Lisa", poblacion: 145023,nombreCorto: 'LIS');
Municipio mun12=Municipio(idMunicipio: 2312, nombre: "Boyeros", poblacion: 199633,nombreCorto: 'BOY');
Municipio mun13=Municipio(idMunicipio: 2313, nombre: "Arroyo Naranjo", poblacion: 205701,nombreCorto: 'ARN');
Municipio mun14=Municipio(idMunicipio: 2314, nombre: "Cotorro", poblacion: 82049,nombreCorto: 'COT');
municipios.add(mun1);
municipios.add(mun2);
municipios.add(mun3);
municipios.add(mun4);
municipios.add(mun5);
municipios.add(mun6);
municipios.add(mun7);
municipios.add(mun8);
municipios.add(mun9);
municipios.add(mun10);
municipios.add(mun11);
municipios.add(mun12);
municipios.add(mun13);
municipios.add(mun14);
notifyListeners();
return municipios;

}


MunicipioProvider();





}