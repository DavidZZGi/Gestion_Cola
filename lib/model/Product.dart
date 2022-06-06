class Product {
String productName;
int cant;
Product({required this.productName,required this.cant});

//getters
String getproductName()=>this.productName;
int getcant()=>this.cant;

//setters
void setproductName(String value){
  this.productName=value;
}
void setcant(int value){
  this.cant=value;
}




}