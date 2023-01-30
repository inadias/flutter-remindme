class Categorie {

 var id;
 var name;
 var description;


categorieMap(){

  var mapping = Map<String, dynamic>();
    mapping['id']=id;
    mapping['name']=name;
    mapping['description']=description;
  return mapping;

  }



}


