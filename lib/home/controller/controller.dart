import 'package:flutter/material.dart';
import 'package:github_api/home/model/model.dart';
import 'package:github_api/home/service/service.dart';
class CounterProvider1 with ChangeNotifier {
  bool dayChange=true;
  List<Repository?> listData=[];
 String selectedOption='30';
 void changeDay(value)async{
  dayChange=value;
  notifyListeners();
  listData.clear();
 await getData(value);
 }
  
  Future<void> getData(bool valu)async
  {
    await Service().getApi(valu).then((value) {
      if(value!=null){
        listData=value;
        notifyListeners();

      }
      return ;
    });
 
  }

  
}