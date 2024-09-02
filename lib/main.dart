import 'package:flutter/material.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Textfield controller
final _controller = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  List toDoList = [
    // ["Make Tutorial", false],
    // ["Study", false]
  ];

  void SaveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void creteNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onCancel: () => Navigator.of(context).pop(),
            onSave: SaveNewTask,
            controller: _controller,
          );
        });
  }


    void deleteTask(int index) {
      setState(() {
        toDoList.removeAt(index);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black,
          backgroundColor: Colors.grey[200],
          title: Text(
            "ToDO App",
            style: TextStyle(fontSize: 15),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            child: Icon(Icons.add), onPressed: creteNewTask),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDOList(
              taskName: toDoList[index][0],
              value: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction:(context) => deleteTask(index),
            );
          },
        ));
  }
}
