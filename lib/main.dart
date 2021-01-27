

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/feed_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/signup_screen.dart';


void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(
  MyApp(),
);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget _getScreenId(){
    return StreamBuilder<User>(stream: FirebaseAuth.instance.authStateChanges(), builder: (BuildContext context, snapshot) {
      if(snapshot.hasData) {
        return HomeScreen(userId: snapshot.data.uid,);
      }else {
        return LoginScreen();
      }

    
    },);
  
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram clone',
     
      home: _getScreenId(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context)=> SignupScreen(),
        FeedScreen.id: (context)=> FeedScreen(),
        
      
      },
    );
  }
}
