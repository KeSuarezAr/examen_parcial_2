import 'package:flutter/material.dart';

class Tarea {
  String titulo;
  String descripcion;
  bool isCompleted;

  Tarea({
    required this.titulo,
    required this.descripcion,
    this.isCompleted = false,
  });
}

class TareaProvider with ChangeNotifier {
  final List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  void addTarea(Tarea tarea) {
    _tareas.add(tarea);
    notifyListeners();
  }

  void removeTarea(Tarea tarea) {
    _tareas.remove(tarea);
    notifyListeners();
  }

  void updateTarea(int index, Tarea tarea) {
    _tareas[index] = tarea;
    notifyListeners();
  }
}
