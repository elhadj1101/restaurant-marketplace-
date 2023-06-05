import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrdersProvider with ChangeNotifier {
  List orders = [];
  List completedOrders = [];
  Future<void> getOrders() async {
    try {
      List<Map<String, dynamic>> temp = [];
      List<Map<String, dynamic>> temp2 = [];
      FirebaseFirestore.instance.collection("Orders").where("userId", isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '').get().then(
  (querySnapshot) {
    for (var element in querySnapshot.docs) {
      final g = element.data();
        g.addAll({'id': element.id});
        
        if (g["status"] == "completed" || g["status"] == "canceled") {
          temp2.add(g);
        }else{
         temp.add(g);
        }
    }
      orders = temp;
      completedOrders = temp2;
      notifyListeners();
  },
  onError: (e) => print("Error completing: $e"),
    );
      
    } catch (error) {
      print("Failed to get orders $error ");
    }
  }

}
