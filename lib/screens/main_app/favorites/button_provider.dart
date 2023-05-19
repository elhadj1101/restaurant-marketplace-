import 'package:flutter/material.dart';

class buttonState extends ChangeNotifier {
  bool container1Color = true;
  bool container2Color = false;

  void changeContainer1Color() {
    container1Color = true;
    container2Color = false;
    notifyListeners();
  }

  void changeContainer2Color() {
    container2Color = true;
    container1Color = false;
    notifyListeners();
  }
}