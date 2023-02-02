import 'package:flutter/material.dart';
import 'package:remind_me/drawer.dart';
import 'package:remind_me/to_do_list_page.dart';
class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Liste"),
        ),
        drawer: DrawerNavigator(),
        floatingActionButton:FloatingActionButton( onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoPage(),))
          ,child: Icon(Icons.add),),




      );
  }
}
