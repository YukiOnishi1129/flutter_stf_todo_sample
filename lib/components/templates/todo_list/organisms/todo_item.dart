import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final GestureTapCallback handlePressDetail;
  final GestureTapCallback handlePressUpdate;
  final GestureTapCallback handlePressDelete;

  const TodoItem({
    Key? key,
    required this.title,
    required this.handlePressDetail,
    required this.handlePressUpdate,
    required this.handlePressDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // 左右の位置調整(flexboxみたいなの)
      crossAxisAlignment: CrossAxisAlignment.center, // 上下の位置調整
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              // 1行で表示させたい場合
              // https://blog.pentagon.tokyo/138/
              maxLines: 1,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          // padding: const EdgeInsets.only(right: 20),
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 詳細画面へ
              SizedBox(
                width: 40,
                child: IconButton(
                  icon: const Icon(Icons.description),
                  onPressed: handlePressDetail,
                ),
              ),
              // 更新画面へ
              SizedBox(
                width: 40,
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: handlePressUpdate,
                ),
              ),
              // 削除処理
              SizedBox(
                width: 40,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: handlePressDelete,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
