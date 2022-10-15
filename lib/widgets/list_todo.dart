import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/services/todo_service.dart';
import 'package:todo/theme.dart';

class ListTodo extends StatefulWidget {
  String title;
  String id;
  bool isChecked;

  ListTodo({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.title),
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) async {
            await TodoService().remove(widget.id);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                print(value);
                setState(
                  () {
                    widget.isChecked = value!;
                  },
                );
              },
            ),
            Expanded(
              child: Text(
                widget.title,
                style: secondaryTextStyle.copyWith(
                  decoration: widget.isChecked == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
