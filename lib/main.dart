// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/mapa_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monitor Sísmico',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MapaScreen(),
    );
  }
}
