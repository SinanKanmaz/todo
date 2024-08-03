import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/core/models/todo.dart';

part 'firestore_service.g.dart';

@Riverpod(keepAlive: true)
class FirestoreService extends _$FirestoreService {
  final _db = FirebaseFirestore.instance;

  @override
  void build() {}

  Future<String> addNewTodo(Todo todo) async {
    DocumentReference ref = await _db.collection("todos").add(todo.toJson());

    await _db.collection("todos").doc(ref.id).update({"id": ref.id});
    return ref.id;
  }

  Future<void> deleteTodo(String? id) async {
    await _db.collection("todos").doc(id).delete();
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    QuerySnapshot<Todo> query = await _db
        .collection("todos")
        .withConverter(
            fromFirestore: (snapshot, options) =>
                Todo.fromJson(snapshot.data()!),
            toFirestore: (todo, _) => todo.toJson())
        .get();

    for (var todo in query.docs) {
      todos.add(todo.data());
    }
    return todos;
  }
}
