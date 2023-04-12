

import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier{
  var _index = 0;
  void onChangeTab(int index){
    _index = index;
    notifyListeners();
  }
  int get index => _index;

}