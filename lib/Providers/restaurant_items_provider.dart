import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsProvider with ChangeNotifier {
  List items = [];
  List onerest_items = [];
  Color promoColor = Colors.grey;

  List<Map<String, dynamic>> promos = [];
  String DocId = '';
  String DocName = '';
  String DocImage = '';
  double discount = 0.0;

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

  Future<void> getPromos() async {
    try {
      final doc = await FirebaseFirestore.instance.collection('promos').get();

      doc.docs.forEach((element) {
        final g = element.data();
        g.addAll({'id': element.id});
        promos.add(g);
      });
      notifyListeners();
    } catch (error) {
      print('Error fetching DocId: $error');
    }
  }

  void checkPromo(String code) {
    int found = 0;

    for (var element in promos) {
      if (element["code"] == code) {
        found = element["percent"];
      }
    }
    if (found == 0) {
      promoColor = Colors.red;
      discount = 0;
    } else {
      discount = found / 100;
      promoColor = Colors.green;
    }
  }

  Future<void> fetchItemsId(String fieldValue) async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('Items')
          .where('restaurentId', isEqualTo: fieldValue);
      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();

      data.docs.forEach((element) {
        temp.add(element.data());
      });
      onerest_items = temp;

      notifyListeners();
    } catch (error) {
      print('Error fetching restaurants: $error');
    }
  }
}
