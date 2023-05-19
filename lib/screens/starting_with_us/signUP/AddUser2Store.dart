import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  final String fullName;
  final String email;
  final String number;
  final String Uid;

  AddUser(this.fullName, this.email, this.number, this.Uid);

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() async {
    try {
      // Add the user's data to Firestore with the same UID
      await FirebaseFirestore.instance.collection('users').doc(Uid).set({
        'name': fullName,
        'email': email,
        'number': number,
        'image':"",
      });
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}
