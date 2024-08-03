import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/repositories/firestore_repository.dart';

part 'todo_list_provider.g.dart';

@Riverpod(keepAlive: true)
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    getTodos();
    return [];
  }

  Future<void> getTodos() async {
    state = await ref.read(firestoreRepositoryProvider.notifier).getTodos();
  }

  void addNewTodo(Todo todo) async {
    try {
      String? id =
          await ref.read(firestoreRepositoryProvider.notifier).addNewTodo(todo);

      state = [...state, todo.copyWith(id: id)];
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteTodo(int index) async {
    try {
      await ref
          .read(firestoreRepositoryProvider.notifier)
          .deleteTodo(state[index].id);
      List<Todo> todos = state;
      todos.removeAt(index);
      state = [];
      state = todos;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }
}
