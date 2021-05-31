import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shopss/models/product.dart';
import 'package:shopss/models/seller.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  final uuid = Uuid();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;

  //add product into the database
  Future addProduct(
      Product product,
      File image1,
      File image2,
      File image3,
      ) async {
    TaskSnapshot taskSnapshotUpload1;
    TaskSnapshot taskSnapshotUpload2;
    TaskSnapshot taskSnapshotUpload3;
    String downloadUrl1 = '';
    String downloadUrl2 = '';
    String downloadUrl3 = '';

    try {
      for (int i = 1; i < 4; i++) {
        //store the picture in firebase storage first
        if (i == 1) {
          final firebaseStorageTask = firebaseStorageRef
              .ref('images')
              .child('${_firebaseAuth.currentUser.email}')
              .child(product.productName + '$i');

          taskSnapshotUpload1 = await firebaseStorageTask.putFile(image1);
          if (taskSnapshotUpload1 != null) {
            downloadUrl1 = await taskSnapshotUpload1.ref.getDownloadURL();
          }
        } else if (i == 2) {
          final firebaseStorageTask = firebaseStorageRef
              .ref('images')
              .child('${_firebaseAuth.currentUser.email}')
              .child(product.productName + '$i');

          taskSnapshotUpload2 = await firebaseStorageTask.putFile(image2);
          if (taskSnapshotUpload2 != null) {
            downloadUrl2 = await taskSnapshotUpload2.ref.getDownloadURL();
          }
        } else if (i == 3) {
          final firebaseStorageTask = firebaseStorageRef
              .ref('images')
              .child('${_firebaseAuth.currentUser.email}')
              .child(product.productName + '$i');

          taskSnapshotUpload3 = await firebaseStorageTask.putFile(image3);
          if (taskSnapshotUpload3 != null) {
            downloadUrl3 = await taskSnapshotUpload3.ref.getDownloadURL();
          }
        }
      }
      var id = uuid.v4();
      //store product in cloud fire store with its picture represented by the ulr from firebase storage
      final result = await database.collection('product').doc(id).set({
        'productId': id,
        'productName': product.productName,
        'productOldPrice': product.productOldPrice,
        'productNewPrice': product.productNewPrice,
        'quantity': product.productQtite,
        'productPicture1': downloadUrl1,
        'productPicture2': downloadUrl2,
        'productPicture3': downloadUrl3,
        'emailPartner': _firebaseAuth.currentUser.email,
        'description': product.productDescription,
        'category': product.productCategory,
        'sizes': product.sizes,
        'colors': product.colors,
        'status': true
      });
      return result;
    } catch (e) {
      return null;
    }
  }

  //get all the products of user based on the email
  Stream<List<Product>> getProducts(){
    try {
      return database.collection('product')
          .where('emailPartner', isEqualTo: _firebaseAuth.currentUser.email)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => Product.fromMap(doc.data()))
          .toList()
      );
    } catch (er) {
      return null;
    }
  }

  //check whether the user has already registered the product or not yet
  Future isRegistered(String productName) async {
    bool status = false;
    try {
      await database
          .collection('product')
          .where('emailPartner', isEqualTo: _firebaseAuth.currentUser.email)
          .get()
          .then((value) {
        for (int i = 0; i < value.docs.length; i++) {
          if (productName == value.docs[i].get('productName')) {
            status = true;
            break;
          }
        }
      });
    } catch (e) {
      return null;
    }
    return status;
  }

  //fetch the partner's seller
  Future<List<Seller>> getProductSell() async {
    List<Seller> prodSell = [];
    await database
        .collection('orders')
        .where('partnerEmail', isEqualTo: _firebaseAuth.currentUser.email)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        final Seller order = Seller(
            orderId: element.get('orderId'),
            productId: element.get('productId'),
            quantity: element.get('quantity'),
            orderDate: element.get('orderDate'));
        prodSell.add(order);
      });
    }).catchError((er) {
      return null;
    });
    //print(prod);
    return prodSell;
  }


}