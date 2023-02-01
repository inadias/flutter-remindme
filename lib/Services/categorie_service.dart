
import 'package:remind_me/Services/model/categorie.dart';
import 'package:remind_me/repositories/repository.dart';
import 'package:sqflite/sqflite.dart';

class CategorieService{
var _repository;

  CategorieService(){
    _repository=Repository();
  }

  saveCreatedCategorie(Categorie categorie) async{
    return await _repository.insertData('categories',categorie.categorieMap());

  }
  readCategories(Categorie categorie)async{

    return await _repository.readData('categories');
  }

  readCategoriesByID(categorieId) async {
    return await _repository.readDataById('categories',categorieId);

  }

  updateCategorie(Categorie categorie) async{
    return await _repository.updateData('categories',categorie.categorieMap());
  }

  deleteCategorie(categorieId) async{
    return await _repository.deleteData('categories',categorieId);

  }

}