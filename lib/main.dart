import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/feature/todo/presenter/todo_page.dart';
import 'package:flutter_redux_app/store/store.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => StoreProvider(
    store: store,
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoListPage(),
    ),
  );
}
