import 'package:line_management/model/Product.dart';
import 'package:line_management/model/client.dart';
import 'package:line_management/model/shop.dart';

import 'municipio.dart';

class Line {
  int idLine;
String nombreMun;
String nombreTienda;
  List<Product> products;
  List<Cliente> clients;

  Line(
      {required this.idLine,
      required this.nombreMun,
      required this.products,
      required this.clients,
      required this.nombreTienda});


      
}
