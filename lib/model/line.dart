import 'package:line_management/model/Product.dart';
import 'package:line_management/model/client.dart';
import 'package:line_management/model/shop.dart';

import 'municipio.dart';

class Line {
  int idLine;
  Municipio municipio;
  Shop shop;
  List<Product> products;
  List<Cliente> clients;

  Line(
      {required this.idLine,
      required this.municipio,
      required this.products,
      required this.clients,
      required this.shop});


      
}
