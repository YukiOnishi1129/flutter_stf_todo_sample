import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodoListScreen extends StatefulWidget {
  final List<Todo> todoList; // 上位widgetから受け取りたいデータ
  const TodoListScreen({Key? key, required this.todoList})
      : super(key: key); // コンストラクタ

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STF TODO'),
      ),
      body: ListView.builder(
        // ListView.builderで一覧表示できる
        // https://www.flutter-study.dev/widgets/list-view-widget
        itemCount: widget.todoList.length, // widget.~で親から受け取ったパラメータを使用できる
        itemBuilder: (context, index) {
          return Text(widget.todoList[index].title); // タイトルを表示しているだけなので、ここを変更する
        },
      ),
    );
  }
}
