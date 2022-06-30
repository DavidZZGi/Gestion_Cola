import 'package:flutter/cupertino.dart';
import 'package:line_management/model/line.dart';
import 'package:line_management/services/localConnectionServices.dart';

class LineProvider with ChangeNotifier{
ConnectionServices _connectionServices=ConnectionServices();
List<Line>lines=[];

Future<void>addLine(Line line)async{
await _connectionServices.insertLine(line);
notifyListeners();
}

Future<List<Line>>getAllLines()async{
lines=await _connectionServices.getLines();
notifyListeners();
return lines;
}
  
}
