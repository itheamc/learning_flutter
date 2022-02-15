import 'package:flutter/foundation.dart';

class DummyProvider with ChangeNotifier {
  final Set<String> _items = {};

  Set<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }
}
