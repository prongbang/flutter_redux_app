import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/core/viewmodel/empty_item_viewmodel.dart';
import 'package:flutter_redux_app/core/viewmodel/item_viewmodel.dart';
import 'package:flutter_redux_app/feature/todo/presenter/todo_viewmodel.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:redux/redux.dart';

class ToDoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, TodoViewModel>(
    converter: (Store<AppState> store) => TodoViewModel.create(store),
    builder: (BuildContext context, TodoViewModel viewModel) => Scaffold(
      appBar: AppBar(
        title: Text(viewModel.pageTitle),
      ),
      body: ListView(children: viewModel.items.map((ItemViewModel item) => _createWidget(item)).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.onAddItem,
        tooltip: viewModel.newItemToolTip,
        child: Icon(viewModel.newItemIcon),
      ),
    ),
  );

  Widget _createWidget(ItemViewModel item) {
    if (item is EmptyItemViewModel) {
      return _createEmptyItemWidget(item);
    } else {
      return _createToDoItemWidget(item);
    }
  }

  Widget _createEmptyItemWidget(EmptyItemViewModel item) => Column(
    children: [
      TextField(
        onSubmitted: item.onCreateItem,
        autofocus: true,
        decoration: InputDecoration(
          hintText: item.createItemToolTip,
        ),
      )
    ],
  );

  Widget _createToDoItemWidget(ToDoItemViewModel item) => Row(
    children: [
      Text(item.title),
      FlatButton(
        onPressed: item.onDeleteItem,
        child: Icon(
          item.deleteItemIcon,
          semanticLabel: item.deleteItemToolTip,
        ),
      )
    ],
  );
}