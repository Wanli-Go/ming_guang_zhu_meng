import 'package:flutter/material.dart';

class BottomNavNotifier extends ChangeNotifier{
  int index = 1;
  
  void changeIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}