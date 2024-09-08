
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/task.dart';
import 'package:flutter_demo/widget/cart_body.dart';
import 'package:flutter_demo/widget/model_bottom.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Task> tasks = [];

  void _handleAddTask(String task) {
    final newTask = Task(id: tasks.length + 1, title: task);
    if (task.isEmpty) {
      return;
    }
    setState(() {
      tasks.add(newTask);
    });
  }
  void _handleDeleteTask(int id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ToDoList',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 40,
              fontWeight: FontWeight.bold,
           ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 0, 238),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: tasks.map((task) => CardBody(
            task : task, 
            deleteTask: _handleDeleteTask,
            index: tasks.indexOf(task),
            )).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              context: context, 
              builder: (BuildContext content) {
                return ModalBottom(addTask: _handleAddTask);

              }
            );
          },
          backgroundColor: const Color.fromARGB(255, 12, 0, 238),
          child:  const Icon(
            Icons.add
            ),
      ),
    );
  }
}



