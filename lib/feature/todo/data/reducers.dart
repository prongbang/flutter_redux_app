import 'package:flutter_redux_app/feature/todo/data/actions.dart';
import 'package:flutter_redux_app/feature/todo/model/todo_item.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:redux/redux.dart';

final Reducer<List<ToDoItem>> toDoListReducer = combineReducers([
  TypedReducer<List<ToDoItem>, AddItemAction>(_addItem),
  TypedReducer<List<ToDoItem>, RemoveItemAction>(_removeItem),
]);

List<ToDoItem> _removeItem(List<ToDoItem> toDos, RemoveItemAction action) =>
    List.unmodifiable(List.from(toDos)..remove(action.item));

List<ToDoItem> _addItem(List<ToDoItem> toDos, AddItemAction action) =>
    List.unmodifiable(List.from(toDos)..add(action.item));

final Reducer<ListState> listStateReducer = combineReducers<ListState>([
  TypedReducer<ListState, DisplayListOnlyAction>(_displayListOnly),
  TypedReducer<ListState, DisplayListWithNewItemAction>(
    _displayListWithNewItem,
  ),
]);

ListState _displayListOnly(ListState listState, DisplayListOnlyAction action) =>
    ListState.listOnly;

ListState _displayListWithNewItem(
        ListState listState, DisplayListWithNewItemAction action) =>
    ListState.listWithNewItem;
