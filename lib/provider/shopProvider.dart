import 'package:flutter/foundation.dart';
import 'package:line_management/model/shop.dart';
import '../services/shopServices.dart';
class ShopProvider with ChangeNotifier{
ShopService _shopService=ShopService() ; 
List<Shop>shops=[];


 ShopProvider.init(){
loadAllShops();
}

Future<List<Shop>> allShopsFromPlY()async{
 List<Shop>shopsOfAMun=[];
shopsOfAMun=await _shopService.allShopsGivenAMun();
notifyListeners();
return shopsOfAMun;
}

Future<List<Shop>>loadAllShops()async{
shops=await _shopService.loadAllShops();
notifyListeners();
return shops;
}
ShopProvider();

} 