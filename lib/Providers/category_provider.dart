import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier {
  List items = [];
  String DocId = '';

  Map<String, dynamic> document = {};

  Future<void> fetchcategoryItems(String fieldValue) async {

    try {
      final collection = FirebaseFirestore.instance
          .collection('Items')
          .where('categoryId', isEqualTo: fieldValue) ;
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

  Future<void> getDocId(int index , fieldValue) async {
    try {      final collection = FirebaseFirestore.instance
        .collection('Items')
        .where('categoryId', isEqualTo: fieldValue) ;
      final data = await collection.get();
      DocId = data.docs[index].reference.id;
      notifyListeners();
    } catch (error) {
      print('Error fetching DocId: $error');
    }
  }
}