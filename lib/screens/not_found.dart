import 'package:flutter/material.dart';
class NotFoundScreen extends StatelessWidget {
  final String name;
  NotFoundScreen({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text('Not used',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: ()=>Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child: Text('You do not have any ${this.name} yet')),
      ),
    );
  }
}
