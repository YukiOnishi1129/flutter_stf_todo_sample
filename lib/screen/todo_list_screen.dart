import 'package:flutter/material.dart';
import 'package:flutter_stf_todo_sample/constants/data.dart';
import 'package:flutter_stf_todo_sample/screen/todo_detail_screen.dart';
import 'package:flutter_stf_todo_sample/screen/todo_update_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key); // コンストラクタ

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _todoList = todoList;

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
          itemCount: _todoList.length, // widget.~で親から受け取ったパラメータを使用できる
          itemBuilder: (context, index) {
            final todo = _todoList[index];

            return Center(
              // 中央寄せ
              child: Container(
                width: 350,
                height: 60,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                // Containerにdecoration
                // https://note.com/hatchoutschool/n/na227e7035f3d
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 左右の位置調整(flexboxみたいなの)
                  crossAxisAlignment: CrossAxisAlignment.center, // 上下の位置調整
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          todo.title,
                          // 1行で表示させたい場合
                          // https://blog.pentagon.tokyo/138/
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.only(right: 20),
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 40,
                            child: IconButton(
                              icon: const Icon(Icons.description),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TodoDetailScreen(todoDetail: todo),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TodoUpdateScreen(todoDetail: todo),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ); // タイトルを表示しているだけなので、ここを変更する
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }
}
