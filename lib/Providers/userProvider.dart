import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';


class UserProvider extends ChangeNotifier {
  String username = '';
  String email = '';
  String phone = '';
  String image = "";
  String password = "";
  String address = "";
  bool imageUploaded = false;
  bool isLogged = false;
  String userID = "";


  void setInitialData(String username, String email, String password) {
    this.username = username;
    this.email = email;
    this.password = password;
    notifyListeners();
  }

  void setUserData(String username, String email, String image, String address,
      String phone) {
    this.username = username;
    this.email = email;
    this.image = image;
    this.address = address;
    this.phone = phone;
    notifyListeners();
  }

  void setImage(String img) {
    image = img;
    notifyListeners();
  }

  void setRemainDate(String add, String phone) {
    this.phone = phone;
    address = add;
    notifyListeners();
  }

  Future<String> uploadImageToFirebase(String userId, String imagePath) async {
    File imageFile = File(imagePath);
    // Create a reference to the location you want to upload to in Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('user_images/${userId}_${Path.basename(imageFile.path)}');

    // Upload the file to Firebase Storage
    UploadTask uploadTask = storageReference.putFile(imageFile);

    // Wait for the upload to complete and return the download URL
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
    setImage(downloadURL);
    if (image != '') {
      imageUploaded = true;
    }
    print('Image uploaded. Download URL: $downloadURL');
    return downloadURL;
  }

  void updateDocument() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final DocumentReference documentRef =
            firestore.collection('users').doc(userID);
        await documentRef.update({
          'name': username,
          'email': email,
          'number': phone,
          'image': image,
          'imageUploaded':imageUploaded,
        });
      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  Future<void> getUserData() async {
    userID = FirebaseAuth.instance.currentUser?.uid ?? '';
    final DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(userID);
    try {
      DocumentSnapshot documentSnapshot = await userDoc.get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        // Access user information

        String username = userData['name'] ?? '';
        String email = userData['email'] ?? '';
        String phone = userData['number'] ?? '';
        String image = userData['image'] ?? '';
        String address = userData['address'] ?? '';
        setUserData(username, email, image, address, phone);

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
