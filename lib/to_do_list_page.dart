

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/Services/categorie_service.dart';
import 'package:remind_me/Services/model/todo.dart';
import 'package:remind_me/Services/todo_service.dart';
import 'package:remind_me/animation_delay.dart';
import 'package:intl/intl.dart';
class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _toDoTitleController = TextEditingController();
  final _toDoDescriptionController = TextEditingController();
  final _toDoDateController = TextEditingController();
  var _selectedValue;

  @override
  void initState(){
    super.initState();
    _loadCategorie();

  }


 // ignore: prefer_collection_literals
final _categories = <DropdownMenuItem>[];

// liste déroulante
  _loadCategorie() async {
    var _categorieService= CategorieService();
    var categories = await _categorieService.readCategories();
    categories.forEach((categorie){
      setState(() {
        _categories.add(DropdownMenuItem(
          value: categorie['name'],
          child: Text(categorie['name']),
        ));
      });
    });

  }

  DateTime _dateTime= DateTime.now();
  _selectedTodoDate(BuildContext context) async{
      var pickDate= await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100)
      );
    if (pickDate != null){
      setState(() {
        _toDoDateController.text= DateFormat('dd-MM-yyyy').format(pickDate);
        _dateTime=pickDate;
      }
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un tâche"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              TextField(
                controller: _toDoTitleController,
                decoration: InputDecoration(
                  labelText: 'Titre',
                  hintText: 'Saisir un titre' ,
                ) ,
              ),

              TextField(
                controller: _toDoDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Plus de details' ,
                ) ,
              ),

              Material(
                child: TextField(
                  controller: _toDoDateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'Saisir une date' ,
                    prefixIcon: InkWell(
                      onTap: (){
                        _selectedTodoDate(context);
                      },
                      child: const Icon(Icons.calendar_today),
                    )
                  ) ,
                ),
              ),

              DropdownButtonFormField(
                  value:_selectedValue,
                  items:_categories,
                  hint: Text('Categorie'),

                  onChanged: (value)=>{
                    setState((){
                      _selectedValue=value;
                    })
                  }),
             
            SizedBox(height: 20,),
              DelayedAnimation(
                delay: 1000,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),

                    padding: EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 7,
                    ),
                  ),
                  child: Text(
                    'Créer',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed:()async {
                    var todo=Todo();

                    todo.titre=_toDoTitleController.text;
                    todo.description=_toDoDescriptionController.text;
                    todo.categorie=_selectedValue.toString();
                    todo.tododate=_toDoDateController.text;
                    todo.isFinished=0;
                    print(todo.tododate);
                    var todoService = TodoService();
                    var resultat= await todoService.saveCreatedTodo(todo);
                    print(_toDoDateController);
                    if(resultat>0){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("La creation a été prise en compte "),
                            backgroundColor: Colors.green[400],
                            elevation: 10, //shadow
                          )
                      );
                    }


                  }

                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
