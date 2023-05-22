import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class RestaurantProvider with ChangeNotifier {
  List restaurants = [];

  Future<void> fetchRestaurants() async {
    try {
      final collection = FirebaseFirestore.instance.collection('Restaurents');



      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();

      data.docs.forEach((element) {
        temp.add(element.data());
      });
      notifyListeners();

      restaurants = temp;

    } catch (error) {
      print('Error fetching restaurants: $error');
    }
  }
}
