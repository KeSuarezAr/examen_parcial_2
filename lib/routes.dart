import 'package:flutter/material.dart';

import 'package:examen_parcial_2/pages/home.dart';
import 'package:examen_parcial_2/pages/lista_tareas.dart';

final routes = <String, WidgetBuilder>{
  'home': (BuildContext context) => const HomePage(),
  'lista_tareas': (BuildContext context) => const ListaTareas(),
};
