

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/Services/categorie_service.dart';
import 'package:remind_me/animation_delay.dart';
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
  void initState(){
    super.initState();
    _loadCategorie();
  }

  var _selectedValue;
 // ignore: prefer_collection_literals
var _categories = <DropdownMenuItem>[];


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
                    onTap: (){},
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
                  onPressed:(){}

                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
