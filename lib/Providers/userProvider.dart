import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';

class UserProvider extends ChangeNotifier {
  String username = '';
  String email = '';
  String phone = '';
  String image = '';
  bool imageUploaded = false;
  bool isLogged = false;
  final UserID = FirebaseAuth.instance.currentUser?.uid ?? '';

  void setUserData(String username, String email, String phone) {
    this.username = username;
    this.email = email;
    this.phone = phone;
    notifyListeners();
  }

  Future<String> uploadImageToFirebase(String userId, File imageFile) async {
    // Create a reference to the location you want to upload to in Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('user_images/${userId}_${Path.basename(imageFile.path)}');

    // Upload the file to Firebase Storage
    UploadTask uploadTask = storageReference.putFile(imageFile);

    // Wait for the upload to complete and return the download URL
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadURL;
  }

  void uploadImage(String userID, String imagePath) async {
    File imageFile = File(imagePath); // Replace with the actual image file path

    String downloadURL = await uploadImageToFirebase(userID, imageFile);
    image = downloadURL;
    if (image != '') {
      imageUploaded = true;
    }
    print('Image uploaded. Download URL: $downloadURL');
  }

  void updateDocument() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final DocumentReference documentRef =
          firestore.collection('users').doc(UserID);

      await documentRef.update({
        'name': username,
        'email': email,
        'number': phone,
        'image': image,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  Future<void> getUserData() async {
    final DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(UserID);
    try {
      DocumentSnapshot documentSnapshot = await userDoc.get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        // Access user information
        username = userData['name'] ?? '';
        email = userData['email'] ?? '';
        phone = userData['number'] ?? '';
        image = userData['image'] ?? '';

        if (username != '') {
          isLogged = true;
        }
        // Do something with the user data
      } else {
        print('User does not exist');
      }
    } catch (e) {
      // Handle any errors
      print('Error retrieving user data: $e');
    }
  }
}
