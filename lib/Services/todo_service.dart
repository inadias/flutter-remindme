
import 'package:remind_me/Services/model/categorie.dart';
import 'package:remind_me/Services/model/todo.dart';
import 'package:remind_me/repositories/repository.dart';
import 'package:sqflite/sqflite.dart';

class TodoService{
var _repository;

  TodoService(){
    _repository=Repository();
  }

  saveCreatedTodo(Todo todo) async{
    return await _repository.insertData('todo',todo.todoMap());

  }

  Future<List<Map<String, dynamic>>> readTodo() async {
    return await _repository.readData('todo');
  }

  readTodoByID(todoId) async {
    return await _repository.readDataById('todo',todoId);

  }

  updateTodo(Todo todo) async{
    return await _repository.updateData('todo',todo.todoMap());
  }

  deleteTodo(todoId) async{
    return await _repository.deleteData('todo',todoId);

  }

}