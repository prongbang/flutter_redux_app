import 'package:flutter_redux_app/feature/todo/model/todo_item.dart';

class AppState {
  final List<ToDoItem> toDos;
  final ListState listState;

  AppState(this.toDos, this.listState);

  factory AppState.initial() => AppState(List.unmodifiable([]), ListState.listOnly);
}

enum ListState {
  listOnly, listWithNewItem
}