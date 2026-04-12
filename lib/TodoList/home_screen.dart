import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'database.dart';
import 'dialog_box.dart';
import 'todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  final _mybox= Hive.box("myBox");
  TodoDatabase db= TodoDatabase();

  @override
  void initState() {
    if(_mybox.get("TodoList")== null){
      db.createData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  // List TodoList= [
  //   ["TODO", false],
  //   ["TODO", false],
  //   ["TODO", false],
  //   ["TODO", false],
  //   ["TODO", false],
  //   ["TODO", false],
  // ];

  void deleteTask(int index){
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void checkBoxChange(bool? value, int index){
    setState(() {
      db.TodoList[index][1]= !db.TodoList[index][1];
    });
    db.loadData();
  }

  void createNewTask(){
    showDialog(context: context,
        builder: (context){
      return DialogBox(
          controller: _controller,
          onCancel: ()=> Navigator.of(context).pop(),
          onSave: saveNewTask);
        });
    db.updateDatabase();
  }

  void saveNewTask(){
    setState(() {
      db.TodoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
          title: Text('TODO'),
        backgroundColor: Colors.deepPurple.shade400,
        elevation: 10,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemBuilder: (context, index){
          return TodoItem(
            isChecked: db.TodoList[index][1],
            todoText: db.TodoList[index][0],
            onChanged: (value)=> checkBoxChange(value, index),
            onPressed: (context)=> deleteTask(index),);
        },
        itemCount: db.TodoList.length)
    );
  }
}
