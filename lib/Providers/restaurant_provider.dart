import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantProvider with ChangeNotifier {
  List restaurants = [];
  List addresses = [];
  final url = 'https://rest-recommander-sba.onrender.com/recommend?keyword';
  String res = '';
  Future<void> fetchRestaurants() async {
    try {
      final collection = FirebaseFirestore.instance.collection('Restaurents');
      dynamic resss = await SearchRestaurents('PANINO');
      print(resss);
      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();

      data.docs.forEach((element) {
        final g = element.data();
        g.addAll({'id': element.id});
        temp.add(g);
      });
      notifyListeners();

      restaurants = temp;
      addresses = restaurants
          .map((restaurant) => {
                {
                  'address': restaurant['mapAddress'] as String,
                  'id': restaurant['id']
                }
              })
          .toList();
    } catch (error) {
      print('Error fetching restaurants: $error');
    }
  }

  Future<dynamic> SearchRestaurents(String name) async {
    final rests = await http.get(Uri.parse('$url=$name'));
    dynamic jsRes = '';

    if (rests.statusCode == 200) {
      // Request was successful
      jsRes = json.decode(rests.body);
    } else {
      // Request failed
      jsRes = 'Error: ${rests.statusCode}';
    }
    return jsRes;
  }
}
