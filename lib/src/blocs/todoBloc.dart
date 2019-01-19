import 'package:exampletododevindo/src/models/todoModels.dart';
import 'package:exampletododevindo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<List<Todo>>();
  final _title = BehaviorSubject<String>();
  final _id = BehaviorSubject<String>();

  Observable<List<Todo>> get allTodo => _todoFetcher.stream;
  Function(String) get updateTitle => _title.sink.add;
  Function(String) get getId => _id.sink.add;

  fetchAllTodo() async {
    List<Todo> todo = await _repository.fetchAllTodo();
    _todoFetcher.sink.add(todo);
  }

  addSaveTodo() {
    _repository.addSaveTodo(_title.value);
  }

  updateTodo() {
    print(_id.value);
    _repository.updateSaveTodo(_id.value);
  }
  

  dispose(){
    _title.close();
    _id.close();
    _todoFetcher.close();
  }
}

final bloc = TodoBloc();
