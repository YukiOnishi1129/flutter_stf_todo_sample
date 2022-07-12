import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodoCreateScreen extends StatefulWidget {
  final int lastId;
  const TodoCreateScreen({Key? key, required this.lastId}) : super(key: key);

  @override
  State<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  // 入力値の定義
  late TextEditingController _titleController;
  late TextEditingController _contentsController;
  bool disabled = true;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentsController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentsController.dispose();
  }

  void _handleTitleInputValue(String inputValue) {
    setState(() {
      disabled = inputValue.isEmpty;
    });
  }

  void _handleContentInputValue(String inputValue) {
    setState(() {
      disabled = inputValue.isEmpty;
    });
  }

  void _submitCreateTodo(BuildContext context) {
    Navigator.of(context).pop(Todo(
      (widget.lastId + 1).toString(),
      _titleController.text,
      _contentsController.text,
      DateTime.now(),
      DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('作成'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          // vertical: 30, // 垂直方向に余白
          horizontal: 30,
        ),
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'タイトル',
                  ),
                  onChanged: _handleTitleInputValue,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  maxLines: null,
                  controller: _contentsController,
                  decoration: const InputDecoration(
                    labelText: '内容',
                  ),
                  onChanged: _handleContentInputValue,
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _submitCreateTodo(context),
                    child: const Text(
                      '作成',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
