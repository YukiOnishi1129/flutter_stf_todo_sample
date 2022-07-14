import 'package:flutter/material.dart';

import '../components/layouts/detail_base_body_layout.dart';
import '../model/todo_model.dart';

class TodoDetailScreen extends StatefulWidget {
  final Todo todoDetail;
  const TodoDetailScreen({Key? key, required this.todoDetail})
      : super(key: key);

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('詳細'),
      ),
      body: DetailBaseBodyLayout(
        child: Column(
          children: [
            TextField(
              enabled: false, // 非活性
              controller: TextEditingController(text: widget.todoDetail.title),
              decoration: const InputDecoration(
                // https://qiita.com/sekitaka_1214/items/17cccc94a9e7150cdf3a
                labelText: 'タイトル',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              enabled: false,
              // 複数行表示
              // https://minpro.net/flutter-dart-textfield-fold
              maxLines: null,
              controller:
                  TextEditingController(text: widget.todoDetail.content),
              decoration: const InputDecoration(
                labelText: '内容',
              ),
            ),
            const SizedBox(
              height: 160,
            )
          ],
        ),
      ),
    );
  }
}
