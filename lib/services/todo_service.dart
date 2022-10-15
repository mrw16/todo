import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/models/todo_model.dart';

class TodoService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<TodoModel>> getTask() {
    try {
      return firestore
          .collection('todos')
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<TodoModel>((DocumentSnapshot todo) {
          print(todo.data());
          return TodoModel.fromJson(todo.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
            (TodoModel a, TodoModel b) => a.createdAt.compareTo(b.createdAt));

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future checkedTask(uid) async {
    await firestore.collection('todos').doc(uid).update({"isChecked": true});
  }

  Future checkTask(uid) async {
    await firestore.collection('todos').doc(uid).update({"isChecked": false});
  }

  Future remove(uid) async {
    await firestore.collection('todos').doc(uid).delete();
  }

  Future<void> addTodo({
    required String title,
    required bool isChecked,
  }) async {
    var uniq = UniqueKey().hashCode.toString();

    try {
      firestore.collection('todos').doc(uniq).set({
        'id': uniq,
        'title': title,
        'isChecked': isChecked,
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Task Berhasil Disimpan'),
      );
    } catch (e) {
      throw Exception('Task Gagal Disimpan');
    }
  }
}
