import 'package:flutter/cupertino.dart';

class Store with ChangeNotifier {
  String connect = 'connected';
  int count = 0;

  void add() {
    count++;
    notifyListeners();
  }

  void remove() {
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }
}
