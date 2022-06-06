class Municipio{
int idMunicipio;
String nombre;
double poblacion;

Municipio({required this.idMunicipio,required this.nombre,required this.poblacion});

String getnombre()=>this.nombre;
double getpoblacion()=>this.poblacion;

void setNombre(String value){
  this.nombre=value;
}

void setPoblacion(double value){
  this.poblacion=value;
}


}