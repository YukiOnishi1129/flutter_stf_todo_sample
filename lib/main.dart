import 'package:flutter/material.dart';
import 'package:flutter_stf_todo_sample/screen/todo_list_screen.dart';

import 'constants/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STF TODO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(
        todoList: todoList, // 親から子供へパラメータの受け渡し方
      ),
    );
  }
}
