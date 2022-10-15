import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({super.key});

  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(
                () {
                  isChecked = value!;
                },
              );
            },
          ),
          Expanded(
            child: Text(
              'Learn how to make mobile UI by 11am',
              style: secondaryTextStyle.copyWith(
                decoration: isChecked == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
