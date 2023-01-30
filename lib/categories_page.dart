import 'package:flutter/material.dart';
import 'package:remind_me/Services/categorie_service.dart';
import 'package:remind_me/Services/model/categorie.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var _categorie = Categorie();
  var _categorie_service = CategorieService();
  var _categorieController = TextEditingController();
  var _descriptionController = TextEditingController();

  List<Categorie> _categorieList = <Categorie>[];

  @override
  void initState(){
    super.initState();
    getAllCategories();
  }
  getAllCategories()async{
       List<Categorie>_categorieList =<Categorie>[];
    var allCategorie = await _categorie_service.readCategories(_categorie);
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
                  _categorie.name=_categorieController.text;
                  _categorie.description=_descriptionController.text;
                  var resultat = await _categorie_service.saveCreatedCategorie(_categorie);
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
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _categorieController,
                    decoration: InputDecoration(
                        hintText: 'Type Catégorie', labelText: 'Categories'),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Description de la categorie',
                        labelText: 'Description'),
                  ),
                ],
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
          return Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){},

              ),title: Row(
                children: <Widget>[
                  Text(_categorieList[index].name),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
            ],
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
