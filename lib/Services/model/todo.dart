class Todo{
  int? id;
  String? titre;
  String? description;
  String? categorie;
  String? tododate;
  int? isFinished;

  Todo({
    this.id,
    this.titre,
    this.description,
    this.categorie,
    this.tododate,
    this.isFinished,
  });


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