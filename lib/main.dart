import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Screen ",
      home: LoginScreen(),
    ),
  );
}