import 'dart:async';

import 'package:flutter_redux_app/feature/todo/data/actions.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:redux/redux.dart';

Future saveListMiddleware(Store<AppState> store, SaveListAction action, NextDispatcher next) async {
  await Future.sync(() => Duration(seconds: 3)); // Simulate saving the list to disk
  next(action);
}