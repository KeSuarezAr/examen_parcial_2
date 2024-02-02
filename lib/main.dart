import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:examen_parcial_2/routes.dart';
import 'package:examen_parcial_2/models/tarea.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TareaProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
    );
  }
}
