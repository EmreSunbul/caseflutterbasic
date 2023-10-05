// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study/view/LoginScreen.dart';



void main() {
  runApp(ProviderScope(child:  MainApp()));
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:LoginPage(),
    );
  }
}
