

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
  var toDoTitleController = TextEditingController();

  var toDoDescriptionController = TextEditingController();

  var toDoDateController = TextEditingController();
  var toDodCategorieController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _loadCategorie();

  }

  var _selectedValue;
 // ignore: prefer_collection_literals
var _categories = <DropdownMenuItem>[];

// liste déroulante
  _loadCategorie() async {
    var _categorieService= CategorieService();
    var categories = await _categorieService.readCategories();
    categories.forEach((categorie){
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(categorie['name']),
          value: categorie['name'],
        ));
      });
    });

  }
  DateTime _dateTime= DateTime.now();
  _selectedTodoDate(BuildContext context) async{
    var _pickDate= await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2012), lastDate: DateTime(2050));
    if (_pickDate!=null){
      setState(() {
        _dateTime=_pickDate;
        toDoDateController.text=DateFormat('dd-MM-yyyy').format(_dateTime);
      });

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
                    onTap: (){
                      _selectedTodoDate(context);
                    },
                    child: Icon(Icons.calendar_today),
                  )
                ) ,
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

                    todo.titre=toDoTitleController.text;
                    todo.description=toDoDescriptionController.text;
                    todo.categorie=toDodCategorieController.toString();
                    todo.tododate=toDoDateController.text;
                    todo.isFinished=0;
                    var todoService = TodoService();
                    var resultat= await todoService.saveCreatedTodo(todo);
                    if(resultat>0){
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
