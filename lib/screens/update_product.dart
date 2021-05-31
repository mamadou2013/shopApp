

import 'package:flutter/material.dart';
import 'package:shopss/services/user_service.dart';

class UpdateProduct extends StatefulWidget {

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController productName=TextEditingController();
  TextEditingController productPrice=TextEditingController();
  TextEditingController productCategory=TextEditingController();
  TextEditingController productQuantity=TextEditingController();
  TextEditingController productDescription=TextEditingController();
  String name;
  String price;
  String quantity;
  String description;

  final UserService userService=UserService();
  Map prod={};

  @override
  Widget build(BuildContext context) {
    prod = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        leading: IconButton(
          onPressed:() {Navigator.pushReplacementNamed(context, '/myProduct');},
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text('Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[200],
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Update the product',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network('${prod['picture']}',fit: BoxFit.cover,),
                ),
                TextFormField(
                  cursorColor: Colors.grey,
                  //controller: productName,
                  initialValue: '${prod['name']}',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //hintText: '${prod['name']}',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.pink, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      prod['name']=value;
                    });
                  },
                  validator: (value) {
                    return value.isEmpty
                        ? 'The name of the product is required'
                        : null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  cursorColor: Colors.grey,
                  //controller: productPrice,
                  initialValue: '${prod['price']}',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    //hintText: '${prod['price']}',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.pink, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      prod['price']= value;
                    });
                  },
                  validator: (value) {
                    return value.isEmpty
                        ? 'The price of the product is required'
                        : null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  cursorColor: Colors.grey,
                  //controller: productQuantity,
                  initialValue:'${prod['quantity']}',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    //hintText: '${prod['quantity']}',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.pink, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      prod['quantity']= value;
                    });
                  },
                  validator: (value) {
                    return value.isEmpty
                        ? 'The quantity of the product is required'
                        : null;
                  },
                ),
                SizedBox(height: 5.0,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  //Normal textInputField will be displayed
                  maxLines: 5,
                  // when user presses enter it will adapt to it
                  cursorColor: Colors.grey,
                  //controller: productDescription,
                  initialValue: '${prod['description']}',
                  decoration: InputDecoration(
                    //hintText: '${prod['description']}',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.pink, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      prod['description']=value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        'Update',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                      onPressed: () async {

                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
