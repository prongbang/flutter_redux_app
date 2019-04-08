
import 'package:flutter_redux_app/feature/todo/data/state.dart';
import 'package:flutter_redux_app/middleware/middleware.dart';
import 'package:flutter_redux_app/reducers/reducers.dart';
import 'package:redux/redux.dart';

final Store<AppState> store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: createStoreMiddleware(),
);
