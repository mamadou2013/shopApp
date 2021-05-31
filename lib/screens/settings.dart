import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          title: Text(
            'Manage your account here',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
          child: Text(
            'This functionality has not been yet implemented. It will be available very soon',
            style: TextStyle(fontSize: 16.0),
          ),
        ));
  }
}
