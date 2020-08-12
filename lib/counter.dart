import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _counter;

  Counter(this._counter);

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
