import 'package:flutter/material.dart';
import 'package:shopss/services/category_service.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String categoryName = '';
  final CategoryService categoryService = CategoryService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add category'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (value){
                setState(() {
                  categoryName = value;
                });
              },
            ),
            FlatButton(
              onPressed: () async{
                print(categoryName);
                await categoryService.addCategory(categoryName);
              },
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text('Add your category',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
            )
          ],
        ),
      ),
    );
  }
}
