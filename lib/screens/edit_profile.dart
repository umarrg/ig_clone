import 'package:flutter/material.dart';
import 'package:instagram/model/user_model.dart';

class EditProfile extends StatefulWidget {
  final User user;
  EditProfile({this.user});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('Edit profile')),
      ),
    );
  }
}
