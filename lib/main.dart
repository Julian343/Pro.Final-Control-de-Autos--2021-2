//Juan Carlos Julian Luis

import 'package:control_autos/pages/all_vehicles.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control de autos',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const allVehicles(),
    );
  }
}
