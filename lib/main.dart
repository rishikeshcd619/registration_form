import 'package:flutter/material.dart';
import 'package:registration/screens/form_screen.dart';
import 'package:registration/screens/super_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FormScreen(),
    );
  }
}
