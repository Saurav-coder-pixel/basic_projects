import 'package:hive/hive.dart';

class TodoDatabase {
  List TodoList = [];

  final _myBox = Hive.box('MyBox');

  void createData() {
    TodoList = [
      ["TODO", false],
    ];
  }

    void loadData() {
      TodoList = _myBox.get("TodoList");
    }

    void updateDatabase() {
      _myBox.put("TodoList", TodoList);
    }
}