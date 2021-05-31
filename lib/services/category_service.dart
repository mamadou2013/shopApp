import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopss/models/category.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
  final Uuid uuid = Uuid();
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  //get all categories from fire store
  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    try {
      await _database.collection('category').get().then((value) {
        value.docs.forEach((element) {
          Category category = Category(
            categoryId: element.get('categoryId'),
            categoryName: element.get('categoryName'),
          );
          categories.add(category);
        });
      });
    } catch (er) {
      Fluttertoast.showToast(
          msg: 'Network error, please try again later!',
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }
    return categories;
  }

  //add category into your fire store
  Future addCategory(String categoryName) async {
    String id = uuid.v4();
    try {
      return await _database
          .collection('category')
          .doc(categoryName)
          .set({'categoryId': id, 'categoryName': categoryName});
    } catch (e) {
      return null;
    }
  }
}
