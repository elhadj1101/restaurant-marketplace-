import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ItemsProvider with ChangeNotifier {
  List items = [];
  String DocId = '';

  Map<String, dynamic> document = {};
  

  Future<void> fetchItems() async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('Items')
          .orderBy('numOfOrders', descending: true);
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
      final collection = FirebaseFirestore.instance
          .collection('Items')
          .orderBy('numOfOrders', descending: true);
      final data = await collection.get();
      DocId = data.docs[index].reference.id;
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
}
