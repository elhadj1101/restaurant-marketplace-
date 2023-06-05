import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reviewsprovider with ChangeNotifier {
  List reviews = [];
  List users = [] ;


  String DocId = '';
  String DocName = '';
  String DocImage = '';
  Map<String, dynamic> document = {};

  Future<void> fetchItems() async {
    try {
      final collection = FirebaseFirestore.instance.collection('Items');
      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();
      data.docs.forEach((element) {
        temp.add(element.data());
      });
      items = temp;

      notifyListeners();
    } catch (error) {
      print('Error fetching restaurants: $error');
    }
  }

  Future<void> getDocId(int index) async {
    try {
      final collection = FirebaseFirestore.instance.collection('Items');
      final data = await collection.get();
      DocId = data.docs[index].reference.id;
      DocName = data.docs[index].data()["name"];
      DocImage = data.docs[index].data()["photoId"];
      notifyListeners();
    } catch (error) {
      print('Error fetching DocId: $error');
    }
  }

  Future<void> getDataFronID(String id) async {
    try {
      final doc =
      await FirebaseFirestore.instance.collection('Items').doc(id).get();
      document = doc.data()!;
      notifyListeners();
    } catch (error) {
      print('Error fetching DocId: $error');
    }
  }




  Future<void> fetchItemsId(String fieldValue) async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('Reviews')
          .where('restaurentId', isEqualTo: fieldValue);
      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();

      data.docs.forEach((element) {
        temp.add(element.data());
      });
      reviews = temp;

      notifyListeners();
    } catch (error) {
      print('Error fetching restaurants: $error');
    }
  }
}
