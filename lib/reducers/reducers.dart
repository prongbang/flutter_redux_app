import 'package:flutter_redux_app/feature/todo/data/reducers.dart';
import 'package:flutter_redux_app/feature/todo/data/state.dart';

AppState appReducer(AppState state, action) => AppState(
      toDoListReducer(state.toDos, action),
      listStateReducer(state.listState, action),
    );
