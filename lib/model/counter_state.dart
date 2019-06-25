import 'package:flutter/foundation.dart';

class CounterState with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int newValue) {
    _counter = newValue;
    notifyListeners();
  }

  increment() {
    counter++;
  }
}
