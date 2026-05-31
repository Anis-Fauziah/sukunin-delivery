import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sukunin Delivery',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sukunin Delivery'),
        ),
        body: const Center(
          child: Text(
            'Project Sukunin Delivery',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}