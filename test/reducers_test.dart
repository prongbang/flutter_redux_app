// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_redux_app/feature/todo/data/actions.dart';
import 'package:flutter_redux_app/feature/todo/model/todo_item.dart';
import 'package:flutter_redux_app/reducers/reducers.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('add an item', () {
    AppState state = AppState(List.unmodifiable([]), ListState.listWithNewItem);
    ToDoItem item = ToDoItem("title");

    AppState result = appReducer(state, AddItemAction(item));

    expect(result.toDos, containsAllInOrder([item]));
  });

  test('remove an item', () {
    ToDoItem item1 = ToDoItem("title1");
    ToDoItem item2 = ToDoItem("title2");
    AppState state = AppState(List.unmodifiable([item1, item2]), ListState.listWithNewItem);

    AppState result = appReducer(state, RemoveItemAction(item1));

    expect(result.toDos, containsAllInOrder([item2]));
  });

  test('display list only', () {
    AppState state = AppState(List.unmodifiable([]), ListState.listWithNewItem);

    AppState result = appReducer(state, DisplayListOnlyAction());

    expect(result.listState, equals(ListState.listOnly));
  });

  test('display list with new item', () {
    AppState state = AppState(List.unmodifiable([]), ListState.listOnly);

    AppState result = appReducer(state, DisplayListWithNewItemAction());

    expect(result.listState, equals(ListState.listWithNewItem));
  });

}
