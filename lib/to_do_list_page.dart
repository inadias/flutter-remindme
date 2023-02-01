import 'package:flutter/material.dart';
class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var toDoTitleController = TextEditingController();

  var toDoDescriptionController = TextEditingController();

  var toDoDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un tâche"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: toDoTitleController,
            decoration: InputDecoration(
              labelText: 'Titre',
              hintText: 'Saisir un titre' ,
            ) ,
          ),
          TextField(
            controller: toDoDescriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Plus de details' ,
            ) ,
          ),
          TextField(
            controller: toDoDateController,
            decoration: InputDecoration(
              labelText: 'Date',
              hintText: 'Saisir une date' ,
              prefixIcon: InkWell(
                onTap: (){},
                child: Icon(Icons.calendar_today),
              )
            ) ,
          )
        ],
      )
    );
  }
}
