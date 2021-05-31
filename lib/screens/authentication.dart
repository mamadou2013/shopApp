import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopss/screens/my_home.dart';
import 'package:shopss/screens/sign_in.dart';
import 'package:shopss/services/user_service.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<UserService>(context,listen: false);
    return StreamBuilder(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final user = snapshot.data;
          return user != null ? MyHome() : SignIn();
        }else{
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
