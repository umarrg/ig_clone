
import 'package:flutter/material.dart';
import 'package:instagram/services/auth_service.dart';

class FeedScreen extends StatelessWidget {
  static final String id = 'feed_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey,
     body: Center(
       child: FlatButton(
         child: Text('LOGOUT'),
         onPressed: () => AuthService.logout(),
       ),
     ),
    );
  }
}