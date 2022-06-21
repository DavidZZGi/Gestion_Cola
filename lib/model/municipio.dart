class Municipio{
int idMunicipio;
String nombre;
String nombreCorto;
double poblacion;

Municipio({required this.idMunicipio,required this.nombre,required this.poblacion,required this.nombreCorto});

String getnombre()=>this.nombre;
double getpoblacion()=>this.poblacion;

void setNombre(String value){
  this.nombre=value;
}

void setPoblacion(double value){
  this.poblacion=value;
}


}