import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/models/todo.dart';
import 'package:todo_app/screens/providers/todo_list_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(todoList[index].title),
          leading: Checkbox(
            onChanged: (v) {},
            value: true,
          ),
          trailing: IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ),
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String? title;
          showDialog(
            context: context,
            builder: (context) => Material(
              child: AlertDialog.adaptive(
                title: const Text('Add New Todo'),
                content: TextField(
                  onChanged: (v) {
                    title = v;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (title != null) {
                        Todo todo = Todo(title: title!);
                        ref.read(todoListProvider.notifier).addNewTodo(todo);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
