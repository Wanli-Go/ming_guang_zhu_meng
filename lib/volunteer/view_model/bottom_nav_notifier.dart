import 'package:flutter/material.dart';

class BottomNavNotifier extends ChangeNotifier{
  int index = 0;
  
  void changeIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}