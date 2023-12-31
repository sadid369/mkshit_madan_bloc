import 'package:flutter/material.dart';
import 'package:mkshit_madan_bloc/features/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Shop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const Home());
  }
}
