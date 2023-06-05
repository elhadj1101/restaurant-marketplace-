import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantProvider with ChangeNotifier {
  List restaurants = [];
  List addresses = [];
  String restId = '';
  List AiRest=[];
  Map<String, dynamic> one_rest_document = {};
  final url = 'https://rest-recommander-sba.onrender.com/recommend?keyword';
  String res = '';
  Future<void> fetchRestaurants() async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('Restaurents')
          .orderBy('rating', descending: true);
      List<Map<String, dynamic>> temp = [];
      final data = await collection.get();
      // print(SearchRestaurents("burger"));
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
  Future<void> SearchRestaurents(String name) async {
    final rests = await http.get(Uri.parse('$url=$name'));

    if (rests.statusCode == 200) {
      // Request was successful
      if (rests.body.contains("we did not find")){
        AiRest=[];
      }else{
       List names = json.decode(rests.body).map((r) => r["name"]).toList();
      AiRest = restaurants.where((e) => names.contains(e["name"].toString().toLowerCase()) ).toList();
      }
      
    } else {
      // Request failed
      // jsRes = 'Error: ${rests.statusCode}';
    }
  }

  Future<void> getDocId(int index) async {
    try {
      final collection = FirebaseFirestore.instance
          .collection('Restaurents')
          .orderBy('rating', descending: true);
      final data = await collection.get();
      restId = data.docs[index].reference.id;
      notifyListeners();
    } catch (error) {
      print('Error fetching DocId: $error');
    }
  }

  Future<void> getDataFronID(String id) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('Restaurents')
          .doc(id)
          .get();
      one_rest_document = doc.data()!;
      notifyListeners();
    } catch (error) {
      print('Error fetching data with DocId: $error');
    }
  }
}
