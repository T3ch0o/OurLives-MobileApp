import 'package:flutter/material.dart';
import 'package:our_lives/pages/landing_page.dart';

import 'api/firebase_service.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      
    ));

    FirebaseService firebaseService = new FirebaseService();
      return MaterialApp(
          title: 'Our Lives',
          theme: ThemeData(
              primarySwatch: Colors.deepPurple
          ),
          debugShowCheckedModeBanner: false,
          home: LandingPage(firebaseService: firebaseService)
      );
  }
}
