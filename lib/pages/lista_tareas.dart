import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:examen_parcial_2/models/tarea.dart';
import 'package:examen_parcial_2/widgets/appbar.dart';

class ListaTareas extends StatefulWidget {
  const ListaTareas({super.key});

  @override
  ListaTareasState createState() => ListaTareasState();
}

class ListaTareasState extends State<ListaTareas> {
  List<Tarea> tareas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        actions: [
          appBar(context),
        ],
      ),
      body: Consumer<TareaProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.tareas.length,
          itemBuilder: (context, index) {
            tareas = provider.tareas;
            return ListTile(
              title: Text(tareas[index].titulo),
              subtitle: Text(tareas[index].descripcion),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _editarTareaForm(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () {
                      _eliminarTarea(index);
                    },
                  ),
                  Checkbox(
                    value: tareas[index].isCompleted,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          tareas[index].isCompleted = value;
                        });
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _agregarTareaForm();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _agregarTareaForm() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';

        return AlertDialog(
          title: const Text('Agregar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                var tarea = Tarea(titulo: title, descripcion: description);
                Provider.of<TareaProvider>(context, listen: false)
                    .addTarea(tarea);
                Navigator.pop(context);
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _editarTareaForm(int index) {
    String title = tareas[index].titulo;
    String description = tareas[index].descripcion;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Título',
                ),
                controller: TextEditingController()..text = title,
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                controller: TextEditingController()..text = description,
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                var tarea = Tarea(titulo: title, descripcion: description);
                Provider.of<TareaProvider>(context, listen: false)
                    .updateTarea(index, tarea);
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _eliminarTarea(int index) {
    Provider.of<TareaProvider>(context, listen: false)
        .removeTarea(tareas[index]);
  }
}
