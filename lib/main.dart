import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/data/database.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();


  // open a box
  var box = await Hive.openBox("mybox");

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
      db.toDoList[index][1] = !db.toDoList[index][1];
    });

    void initState() {
      if(_mybox.get("TODOLIST") == null) {
        db.createInitialData();
      }
      else {
        db.loadData();
      }
      super.initState();
    };
  }


  ToDoDatabase db = ToDoDatabase();

  final _mybox = Hive.box("mybox");



  // List toDoList = [
  //   ["Make Tutorial", false],
  //   ["Study", false]
  // ];

  void SaveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
      db.updateDataBase();
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
      db.toDoList.removeAt(index);
      db.updateDataBase();
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
          title: const Text(
            "ToDO App",
            style: TextStyle(fontSize: 15),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            child: Icon(Icons.add),
            onPressed: creteNewTask),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDOList(
              taskName: db.toDoList[index][0],
              value: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
