import 'package:flutter/material.dart';
import 'package:study/service/service.dart';
import 'package:study/Models/user_model.dart';


class Controller extends ChangeNotifier {
  bool? isloading;

  List<UserModelData?> users=[];

  void getData(){
    Service.fetch().then((value){
     if(value != null) {
       users=value.data!;
       isloading=true;
       notifyListeners();
     } else
     {
      isloading=false;
      notifyListeners();
     }

    });
  }
}
