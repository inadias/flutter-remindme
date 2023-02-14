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


  @override
  void initState(){
    super.initState();
    getAllTodos();
  }

  var _todoList = <Todo>[];

  getAllTodos()async{
    var _todoService= TodoService();
    _todoList =<Todo>[];
    var allTodos = await _todoService.readTodo();
    allTodos.forEach((todo)=>{

      setState((){
        var todoModel= Todo();
        todoModel.id=todo['id'];
        todoModel.titre=todo['titre'];
        todoModel.categorie=todo['categorie'];
        todoModel.description=todo['description'];
        todoModel.tododate=todo['tododate'];
        todoModel.isFinished=todo['isFinished'];
        _todoList.add(todoModel);
      })

    });

  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Liste"),
        ),
        drawer: DrawerNavigator(),
        body: ListView.builder(itemCount: _todoList.length, itemBuilder: (context, index){
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
            ),
            child:ListTile(
              title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_todoList[index].titre ?? 'Pas de titre')
              ],

          ),
              subtitle: Text(_todoList[index].categorie ?? " Pas de cotégorie"),
              trailing: Text(_todoList[index].tododate ?? " Pas de date"),
            )
              );

        }),
        floatingActionButton:FloatingActionButton( onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoPage(),))
          ,child: Icon(Icons.add),),




      );
  }
}
