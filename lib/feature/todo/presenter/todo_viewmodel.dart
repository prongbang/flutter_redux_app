import 'package:flutter/material.dart';
import 'package:flutter_redux_app/core/viewmodel/empty_item_viewmodel.dart';
import 'package:flutter_redux_app/core/viewmodel/item_viewmodel.dart';
import 'package:flutter_redux_app/feature/todo/data/actions.dart';
import 'package:flutter_redux_app/feature/todo/model/todo_item.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:redux/redux.dart';

class TodoViewModel {
  final String pageTitle;
  final List<ItemViewModel> items;
  final Function() onAddItem;
  final String newItemToolTip;
  final IconData newItemIcon;

  TodoViewModel(this.pageTitle, this.items, this.onAddItem, this.newItemToolTip,
      this.newItemIcon);

  factory TodoViewModel.create(Store<AppState> store) {
    List<ItemViewModel> items = store.state.toDos
        .map((ToDoItem item) => ToDoItemViewModel(item.title, () {
              store.dispatch(RemoveItemAction(item));
              store.dispatch(SaveListAction());
            }, 'Delete', Icons.delete) as ItemViewModel)
        .toList();

    if (store.state.listState == ListState.listWithNewItem) {
      items.add(EmptyItemViewModel('Type the next task here', (String title) {
        store.dispatch(DisplayListOnlyAction());
        store.dispatch(AddItemAction(ToDoItem(title)));
        store.dispatch(SaveListAction());
      }, 'Add'));
    }

    return TodoViewModel(
        'To Do',
        items,
        () => store.dispatch(DisplayListWithNewItemAction()),
        'Add new to-do item',
        Icons.add);
  }
}

@immutable
class ToDoItemViewModel extends ItemViewModel {
  final String title;
  final Function() onDeleteItem;
  final String deleteItemToolTip;
  final IconData deleteItemIcon;

  ToDoItemViewModel(this.title, this.onDeleteItem, this.deleteItemToolTip,
      this.deleteItemIcon);
}
