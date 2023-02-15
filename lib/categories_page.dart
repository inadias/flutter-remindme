import 'package:flutter/material.dart';
import 'package:remind_me/Services/categorie_service.dart';
import 'package:remind_me/Services/model/categorie.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final GlobalKey<ScaffoldState> _globalKey= GlobalKey<ScaffoldState>();


  var _categorie = Categorie();
  var _categorieService = CategorieService();


  var _categorieController = TextEditingController();
  var _descriptionController = TextEditingController();


  var _editCategorieNameController = TextEditingController();
  var _editDescriptionController = TextEditingController();



  List<Categorie> _categorieList = <Categorie>[];


  @override
  void initState(){
    super.initState();
    getAllCategories();
  }

  getAllCategories()async{
       _categorieList =<Categorie>[];
    var allCategorie = await _categorieService.readCategories();
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
  var categorie;
  _editCategorie(BuildContext context, categorieId) async{
    categorie = await _categorieService.readCategoriesByID(categorieId);
    setState(() {
      _editCategorieNameController.text=categorie[0]['name']??'no Name';
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

                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(
                  color: Colors.red
                ),),

              ),
              TextButton(
                onPressed: () async{

                  _categorie.name=_categorieController.text;
                  _categorie.description=_descriptionController.text;
                  var resultat = await _categorieService.saveCreatedCategorie(_categorie);
                  Navigator.pop(context);
                  if(resultat > 0){
                    Navigator.pop(context);
                    getAllCategories();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("La creation a été prise en compte "),
                          backgroundColor: Colors.green[400],
                          elevation: 10, //shadow
                        )
                    );
                  }

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


              child: Column(

                children: <Widget>[

                  TextField(
                    controller: _categorieController,
                    decoration: InputDecoration(
                        hintText: 'Type Catégorie', labelText: 'Categories'
                    ),


                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Description de la categorie',
                        labelText: 'Description'
                    ),
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(
                    color: Colors.red
                ),),
              ),

              TextButton(
                onPressed: () async{

                  _categorie.id = categorie[0]['id'];
                  _categorie.name=_editCategorieNameController.text;
                  _categorie.description=_editDescriptionController.text;
                  var resultat = await _categorieService.updateCategorie(_categorie);
                 if(resultat > 0){
                   Navigator.pop(context);
                   getAllCategories();
                   ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text("Modification prise en compte "),
                         backgroundColor: Colors.green[400],
                         elevation: 10, //shadow
                       )
                   );
                 }


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


                child: Column(

                  children: <Widget>[

                    TextField(
                      controller: _editCategorieNameController,
                      decoration: InputDecoration(
                          hintText: 'Type Catégorie', labelText: 'Categories'
                      ),

                    ),
                    TextField(
                      controller: _editDescriptionController,
                      decoration: InputDecoration(
                          hintText: 'Description de la categorie',
                          labelText: 'Description'
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }

  //***********************************************
  //Delete a categorie

  _deleteFormDialog(BuildContext context, categorieId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel',style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                ),),
              ),

              TextButton(

                onPressed: () async{

                  var resultat = await _categorieService.deleteCategorie(categorieId);
                  if(resultat >= 0){
                    Navigator.pop(context);
                    getAllCategories();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("La suppression a été prise en compte "),
                          backgroundColor: Colors.green[400],
                          elevation: 10, //shadow
                        )
                    );
                  }


                },
                child: Text('Supprimer',style: TextStyle(
                    color: Colors.green,
                    fontSize: 14
                )),

              ),

            ],
            title: Text("Vous souhaiter supprimer cette catagories ?",style: TextStyle(
              fontSize: 14
            )),

          );
        });
  }



  //************************************************



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
              IconButton(onPressed: (){
                _deleteFormDialog(context, _categorieList[index].id);

              },
                  icon: Icon(Icons.delete,color: Colors.red,))
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
