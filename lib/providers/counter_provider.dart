
import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  var _count = 0;

  int get count => _count;


  // Function for increment the counter value
  void increment() {
    _count++;
    notifyListeners();
  }

  // Function to decrement the counter value
  void decrement() {
    _count--;
    notifyListeners();
  }

}