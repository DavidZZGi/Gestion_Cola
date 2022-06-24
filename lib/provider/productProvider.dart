import 'package:flutter/cupertino.dart';
import 'package:line_management/model/Product.dart';
import 'package:line_management/services/productoService.dart';

class ProductProvider with ChangeNotifier{
ProductoService _productService=ProductoService();
List<Product> products=[];



Future<List<Product>> getAllProducts()async{
products=await _productService.fetchAllProduct();
notifyListeners();
return products;

}








}