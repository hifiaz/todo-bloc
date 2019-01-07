import 'dart:async';

import 'package:exampletododevindo/src/models/todoModels.dart';
import 'package:exampletododevindo/src/resources/todoApiProvider.dart';

class Repository{
  final todoApiProvider = TodoApiProvider();

  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
}