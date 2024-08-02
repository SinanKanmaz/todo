import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/core/repositories/firestore_repository.dart';

part 'todo_list_provider.g.dart';

@Riverpod(keepAlive: true)
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [];
  }

  void addNewTodo(Todo todo) {
    ref.read(firestoreRepositoryProvider.notifier).addNewTodo(todo);
    state = [...state, todo];
  }

  void deleteTodo(int index) {
    List<Todo> todos = state;
    todos.removeAt(index);
    state = [];
    state = todos;
  }
}
