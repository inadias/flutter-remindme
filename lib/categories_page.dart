import 'package:flutter/material.dart';
import 'package:remind_me/Services/categorie_service.dart';
import 'package:remind_me/Services/model/categorie.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  var _nameCategorie="";
  var _descriptionOfCategorie="";
  var _categorie = Categorie();
  var _categorieService = CategorieService();


  var _categorieController = TextEditingController();
  var _descriptionController = TextEditingController();


  var _editCategorieNameController = TextEditingController();
  var _editDescriptionController = TextEditingController();

  _checkRegistrationValue(){
    if(_formKey.currentState!.validate()){
      return;
    }else{
      return 'Merci de remplir le formumaire de connexion ';
    }
  }

  List<Categorie> _categorieList = <Categorie>[];

  @override
  void initState(){
    super.initState();
    getAllCategories();
  }

  getAllCategories()async{
       _categorieList =<Categorie>[];
    var allCategorie = await _categorieService.readCategories(_categorie);
    allCategorie.forEach((categorie)=>{

      setState((){
        var categorieModel= Categorie();
        categorieModel.id=categorie['id'];
        categorieModel.name=categorie['name'];
        categorieModel.description=categorie['description'];
        _categorieList.add(categorieModel);
      })

    });
  }
  _editCategorie(BuildContext context, categorieId) async{
    var categorie = await _categorieService.readCategoriesByID(categorieId);
    setState(() {
      _editCategorieNameController.text=categorie[0]['name']??'no name';
      _editDescriptionController.text=categorie[0]['description']??'no description';

    });
    _editFormDialog(context);

  }



  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(

                onPressed: () {},
                child: Text('Cancel',style: TextStyle(
                  color: Colors.red
                ),),

              ),
              TextButton(
                onPressed: () async{
                  _checkRegistrationValue;
                  _categorie.name=_categorieController.text;
                  _categorie.description=_descriptionController.text;
                  var resultat = await _categorieService.saveCreatedCategorie(_categorie);

                    print(resultat);

                },
                child: Text('valider',style: TextStyle(
                  color: Colors.green,
                  fontSize: 13
                )),

              ),

            ],
            title: Text("Formulaire de catagories"),
            content: SingleChildScrollView(
              child:Form(
                key: _formKey,

              child: Column(

                children: <Widget>[

                  TextFormField(
                    controller: _categorieController,
                    decoration: InputDecoration(
                        hintText: 'Type Catégorie', labelText: 'Categories'
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Le champs Catégorie est vide";
                      }
                      return null;
                    },onSaved: (value){
                    _nameCategorie=value!;
                  },

                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Description de la categorie',
                        labelText: 'Description'
                    ), validator: (value) {
                    if(value!.isEmpty){
                      return "Le champs Description  est vide";
                    }

                    return null;
                  },onSaved: (value) {
                    _descriptionOfCategorie=value!;
                  },
                  ),

                ],
              ),
            ),
            ),
          );
        });
  }



  _editFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(

                onPressed: () {},
                child: Text('Cancel',style: TextStyle(
                    color: Colors.red
                ),),

              ),
              TextButton(
                onPressed: () async{
                  _checkRegistrationValue;
                  _categorie.name=_categorieController.text;
                  _categorie.description=_descriptionController.text;
                  var resultat = await _categorieService.saveCreatedCategorie(_categorie);

                  print(resultat);

                },
                child: Text('Mise à jour',style: TextStyle(
                    color: Colors.green,
                    fontSize: 13
                )),

              ),

            ],
            title: Text("Editer les catagories"),
            content: SingleChildScrollView(
              child:Form(
                key: _formKey,

                child: Column(

                  children: <Widget>[

                    TextFormField(
                      controller: _editCategorieNameController,
                      decoration: InputDecoration(
                          hintText: 'Type Catégorie', labelText: 'Categories'
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Le champs Catégorie est vide";
                        }
                        return null;
                      },onSaved: (value){
                      _nameCategorie=value!;
                    },

                    ),
                    TextFormField(
                      controller: _editDescriptionController,
                      decoration: InputDecoration(
                          hintText: 'Description de la categorie',
                          labelText: 'Description'
                      ), validator: (value) {
                      if(value!.isEmpty){
                        return "Le champs Description  est vide";
                      }

                      return null;
                    },onSaved: (value) {
                      _descriptionOfCategorie=value!;
                    },
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Categories"),
      ),
      body: ListView.builder(
            itemCount:_categorieList.length, itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.only(top:8.0,left: 16.0, right: 16.0),
            child: Card(
              elevation:8.0 ,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: (){
                    _editCategorie(context, _categorieList[index].id);
                  },

                ),title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_categorieList[index].name),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
              ],
              ),
                subtitle: Text(_categorieList[index].description),
              ),

            ),
          );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
