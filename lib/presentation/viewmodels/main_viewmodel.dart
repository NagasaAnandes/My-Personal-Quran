import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Memberi tahu UI untuk update
  }
}
