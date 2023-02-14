import 'package:flutter/material.dart';
import 'package:remind_me/categories_page.dart';
import 'package:remind_me/welcome_page.dart';


class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Drawer(
        child: ListView(
          children: <Widget> [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/03/12/23/18/man-1253004_960_720.jpg"),
              ),
              accountName: Text("SAIDANI Ziad"),
              accountEmail: Text("inadias@gmail.com"),
              decoration:
              BoxDecoration(color: Colors.blue),
            ),ListTile(
              leading: Icon(Icons.home),
              title: Text("Accueil"),
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage())),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Categories"),
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesPage())),
            )
          ],
        ),
      ),
    );
  }
}

