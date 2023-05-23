import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  final String fullName;
  final String email;
  final String number;
  final String uid;
  final String address;

  AddUser(this.fullName, this.email, this.number, this.uid,this.address);

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() async {
    try {
      // Add the user's data to Firestore with the same UID
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': fullName,
        'email': email,
        'number': "0$number",
        'image':"",
        'address':address,
        
      });
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}
