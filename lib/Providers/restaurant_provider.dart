
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class RestaurantProvider with ChangeNotifier {
  List restaurants = [];
  List addresses =[];

  Future<void> fetchRestaurants() async {
    try {
      final collection = FirebaseFirestore.instance.collection('Restaurents');



      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();

      data.docs.forEach((element) {
        final g = element.data();
        g.addAll({'id': element.id});
        temp.add(g);
      });
      notifyListeners();

      restaurants = temp;
      addresses = restaurants.map((restaurant) => {{'address':restaurant['mapAddress'] as String,'id':restaurant['id']}}).toList();
    } catch (error) {
      print('Error fetching restaurants: $error');
    }
  }
}
