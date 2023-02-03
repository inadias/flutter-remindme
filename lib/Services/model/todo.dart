class Todo{
  var id;
  var titre;
  var description;
  var categorie;
  var tododate;
  var isFinished;


  todoMap(){

    var mapping = Map<String, dynamic>();
    mapping['id']=id;
    mapping['titre']=titre;
    mapping['description']=description;
    mapping['categorie']=categorie;
    mapping['tododate']=tododate;
    mapping['isFinished']=isFinished;
    return mapping;

  }


}