import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryModel extends ChangeNotifier {
  var _status = Status.initial;
  var _index = 0;
  final _controller = PageController(initialPage: 0);

  void changeStatus(Status status) {
    if(_index==0){
    _status = status;
    notifyListeners();
    }else{
      moveToPrevPage();
    }
  }

  void moveToNextPage() {
    if (_index < 2) {
      _index++;
      notifyListeners();
    }
    _controller.nextPage(
        duration: const Duration(microseconds: 400), curve: Curves.bounceIn);
  }
  Future<void> sendToMessage(String message)async{
    _status = Status.loading;
    notifyListeners();
    const token = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODE4NTQzOTgsInVzZXJfaWQiOjN9.t0KC0iFwjCDnOUdYNVSJ2DR5_qWkiwLIUfmXHkWB4WmC6TKykFtC2maofn2msynosFiDRzRNfoc2OlQBxrU77A';
    final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),baseUrl: 'http://89.108.103.40'));
   try{
    Response response = await dio.post('/complaint/profile',
        data: {
          "to_user_id": 1,
          "category": "Спам",
          "text": message
        },
        options:  Options(headers: {
      "Authorization":
      "Bearer $token",
    }));
    if(response.statusCode==200){
      _status = Status.success;
      notifyListeners();
      moveToNextPage();
    }
   }catch(e){
     print(e);
   }
  }
  void moveToPrevPage() {
    if (_index > 0) {
      _index--;
      notifyListeners();
    }
    _controller.previousPage(
        duration: const Duration(microseconds: 400), curve: Curves.bounceInOut);
  }
  void closeTask(){
    _index=0;
    _status = Status.initial;
    notifyListeners();
  }

  Status get status => _status;

  PageController get controller => _controller;

  int get index => _index;
}

enum Status { initial, loading, success, fail, run }
