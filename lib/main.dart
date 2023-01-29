import 'package:Labayh/pages/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LabayhApp());
}

class LabayhApp extends StatelessWidget {
  const LabayhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StartPage());
  }
}
