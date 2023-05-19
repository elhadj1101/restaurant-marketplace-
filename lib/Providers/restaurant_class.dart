import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  final String name;
  final String description;
  final double rating;
  final String rest_image ;

  Restaurant( {required this.name, required this.description, required this.rating , required this.rest_image,});

  factory Restaurant.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Restaurant(
      rest_image: data['photoId'],
      name: data['name'],
      description: data['description'],
      rating: data['rating'],

    );
  }
}