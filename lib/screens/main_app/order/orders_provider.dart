import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ordersProvider with ChangeNotifier {
List orders =[];
Future<void> getOrders() async{
  try {
   print("is run normalyyyyyyyyyyyyyyyyyy"); 
  final collection = FirebaseFirestore.instance.collection("Orders");
  List<Map<String,dynamic>> temp = [];
  final data = await collection.get();
  for (var element in data.docs) { 
    final g = element.data();
    g.addAll({'id': element.id});
    temp.add(g);
  }
  notifyListeners();
  orders = temp;
 List completed_orders= []; 
  for (var element in orders) {
    if (element["status"] == "completed") { completed_orders.add(element);}
  }
  } catch (error) {
    print("Failed to get orders $error ");
  }
}

}