import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

class UpdateProvider extends ChangeNotifier {
  String username = '';
  String email = '';
  String phone = '';
  String image = '';

  void setUserData(String username, String email, String phone, String image) {
    this.username = username;
    this.email = email;
    this.phone = phone;
    this.image = image;
    notifyListeners();
  }

 
}
