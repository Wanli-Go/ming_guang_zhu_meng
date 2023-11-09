import 'package:flutter/material.dart';

class TaskInfoUpdateNotifier extends ChangeNotifier{
  bool isUpdated = false;
  
  void update(){
    isUpdated = true;
    notifyListeners();
  }
}