import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String bio;
  final String email;
  User({
    this.id,
    this.email,
    this.bio,
    this.name,
    this.profileImageUrl,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
        id: doc.data()['id'],
        name: doc.data()['name'],
        profileImageUrl: doc.data()['profileImageUrl'],
        bio: doc.data()['bio'] ?? '',
        email: doc.data()['email']);
  }
}
