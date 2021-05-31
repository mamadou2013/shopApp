import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopss/menu/user_menu.dart';
import 'package:shopss/models/category.dart';
import 'package:shopss/screens/product.dart';
import 'package:shopss/screens/product_forms.dart';
import 'package:shopss/services/category_service.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int selectedIndex = 0;
  final CategoryService categoryService = CategoryService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text('SS-Shop'),
        actions: <Widget>[
          IconButton(
            onPressed: () async{
              List<Category> cat = await categoryService.getCategories();
              if(cat != null){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>ProductForm(cat: cat)
                ));
              }
            },
            icon: Icon(Icons.add_circle_outline, color: Colors.white),
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 5.0),
        color: Colors.grey[100],
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 3.0, 0.0),
              child: Text(
                'Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3.0, 5.0, 3.0, 0.0),
              child: Products(),
            ),
          ],
        ),
      ),
    );
  }

}

