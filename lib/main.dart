import 'package:examen_2/screens/login_screen.dart';
import 'package:examen_2/screens/map_screen.dart';
import 'package:examen_2/screens/retrieve_password.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const DanielPincayLoginScreen(),
        'mapScreen': (context) => const DanielPincayMapScreen(),
        'retrievePassword': (context) => const DanielPincayRetrievePassword()
      },
    );
  }
}
