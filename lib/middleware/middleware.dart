import 'package:flutter_redux_app/feature/todo/data/actions.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:flutter_redux_app/feature/todo/data/middleware.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() => [
  TypedMiddleware<AppState, SaveListAction>(saveListMiddleware),
];
