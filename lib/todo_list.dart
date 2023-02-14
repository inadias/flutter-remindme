import 'package:flutter/material.dart';
import 'package:remind_me/Services/model/todo.dart';
import 'package:remind_me/Services/todo_service.dart';
import 'package:remind_me/drawer.dart';
import 'package:remind_me/to_do_list_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}


class _TodoListState extends State<TodoList> {
  var _todoList = <Todo>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    var _todoService = TodoService();
    var allTodos = await _todoService.readTodo();
    print(allTodos); // Debugging line

    setState(() {
      _todoList = allTodos
          .map((todo) => Todo(
        id: todo['id'],
        titre: todo['titre'],
        description: todo['description'],
        categorie: todo['categorie'],
        tododate: todo['todoDate'],
        isFinished: todo['isFinished'],
      ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste"),
      ),
      drawer: DrawerNavigator(),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_todoList[index].titre ?? 'Pas de titre')
                    ],
                  ),
                  subtitle:
                  Text(_todoList[index].categorie ?? " Pas de cotégorie"),
                  trailing: Text(_todoList[index].tododate ?? " Pas de date"),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TodoPage(onTodoCreated: (Todo todo) {  },),
          ));
          _loadData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
