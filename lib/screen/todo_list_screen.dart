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
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30, // 垂直方向に余白
        ),
        child: ListView.builder(
          // ListView.builderで一覧表示できる
          // https://www.flutter-study.dev/widgets/list-view-widget
          itemCount: widget.todoList.length, // widget.~で親から受け取ったパラメータを使用できる
          itemBuilder: (context, index) {
            return Center(
              // 中央寄せ
              child: Container(
                width: 350,
                height: 50,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                // Containerにdecoration
                // https://note.com/hatchoutschool/n/na227e7035f3d
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.todoList[index].title, style: TextStyle()),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.description),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            ); // タイトルを表示しているだけなので、ここを変更する
          },
        ),
      ),
    );
  }
}
