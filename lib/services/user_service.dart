import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopss/models/user.dart';
import 'package:uuid/uuid.dart';

@immutable
class Use{
  const Use({@required this.uid});
  final String uid;
}

class UserService {
  var uuid = Uuid();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;

  //create user with email and password
  Future createPartner(String name, String email, String phone, String gender,
      String shop, String password) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;

      database.collection('partners').doc(user.email).set({
        'email': user.email,
        'username': name,
        'phone': phone,
        'shop': shop,
        'gender': gender,
        'type':'partner'
      });
      return result.user;
    } catch (e) {
      return null;
    }
  }

  //sign in user with password and email
  Future<Use> loginUser(String email, String password) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _partnerFromFirebase(authResult.user);
    } catch (e) {
      return null;
    }
  }

  //get current user based on user email
  Future<Partner> getCurrentUser() async{
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot userData =
            await database.collection('partners').doc(user.email).get();
        //print('user email: '+userData.get('email'));
        return Partner(
          username: userData.get('username'),
          email: userData.get('email'),
            phone: userData.get('phone'),
          type: userData.get('type')
        );
      } else {
        return null;
      }

    } catch (er) {
      return null;
    }
  }

  //restart user's password
  Future sendNewPassword(String email) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: 'Check your email to confirm the task');
    } catch (e) {
      return null;
    }
  }

  //logout user
  Future logoutUser() async {
    await _firebaseAuth.signOut().catchError((er) {
      return null;
    });
  }

  //check the user has already logged in or not
  Stream<Use> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map((_partnerFromFirebase));
  }

  //sign in with facebook
  Future loginUserWithFacebook() async {}

Use _partnerFromFirebase(User user){
    return user == null ? null : Use(uid: user.uid);
}



  //doing advertisement
 /* Future addAdvertisement(String name, description, File image)async{
    var taskSnapshotUpload1;
    String downloadUrl1='';
    try{
      final firebaseStorageTask = firebaseStorageRef.ref('advertisement')
          .child(name);
      taskSnapshotUpload1 = await firebaseStorageTask.putFile(image);
      downloadUrl1 = await taskSnapshotUpload1.ref.getDownloadURL();

      final id=uuid.v4();
      //store product in cloud fire store with its picture represented by the ulr from firebase storage
      final result = await database.collection('advertisements').doc(id).set({
        'advertId':id,
        'advertName': name,
        'advertDescription': description,
        'advertImage': downloadUrl1,
        'advertStatus': true,
        'advertPeriod': 0,
      });
      return result;
    }catch(e){
      return null;
    }
  }*/

  //update the product
  /*Future updateProduct(Product product) async {
    await database.collection('product').doc(product.productId)
        .update(data)
  }*/
}
