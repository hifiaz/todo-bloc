import 'dart:async';

import 'package:exampletododevindo/src/models/todoModels.dart';
import 'package:exampletododevindo/src/resources/todoApiProvider.dart';

class Repository{
  // final title = '';
  final todoApiProvider = TodoApiProvider();

  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future addSaveTodo(String title) => todoApiProvider.addTodo(title);
  Future updateSaveTodo(String ids) => todoApiProvider.updateTodo(ids);
}