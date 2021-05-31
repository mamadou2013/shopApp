
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopss/models/category.dart';
import 'package:shopss/services/user_service.dart';

class ProductForm extends StatefulWidget {
  final List<Category> cat;

  ProductForm({this.cat});
  @override
  _ProductFormState createState() => _ProductFormState();

}

class _ProductFormState extends State<ProductForm> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController productName=TextEditingController();
  TextEditingController productPrice=TextEditingController();
  TextEditingController productDescription=TextEditingController();
  TextEditingController productQuantity=TextEditingController();

  RegExp re = RegExp(r'^[a-zA-Z0-9]+$');
  RegExp beginWith = RegExp(r'^[!#$%&*+-/=?^_`{|}~]+@]+');

  //var email = "tony@starkindustries.com";
  //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  String category='category';
  final UserService userService=UserService();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            icon: Icon(Icons.close, color: Colors.white,),
          ),
          title: Text('Product Forms'),
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
                    child: Text(
                      'Add a new Product', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: productName,
                    decoration: InputDecoration(
                      hintText: 'Product Name',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(0), width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getColor(1), width: 2.0),
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(2), width: 2.0)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return checkValidation(productName.text,'name');
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: productPrice,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('([0-9]+)')),],
                    decoration: InputDecoration(
                      hintText: 'Product Price',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(0), width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getColor(1), width: 2.0),
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(2), width: 2.0)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return checkFieldNumber(productPrice.text,'price');
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    controller: productQuantity,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('([0-9]+)')),],
                    decoration: InputDecoration(
                      hintText: 'Product Quantity',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(0), width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getColor(1), width: 2.0),
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(2), width: 2.0)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return checkFieldNumber(productQuantity.text, 'quantity');
                    },
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(3.0, 5.0, 3.0, 2.0),
                      child: buildCategories(),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    //Normal textInputField will be displayed
                    maxLines: 5,
                    // when user presses enter it will adapt to it
                    cursorColor: Colors.grey,
                    controller: productDescription,
                    decoration: InputDecoration(
                      hintText: 'Product Description',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(0), width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getColor(1), width: 2.0),
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: getColor(2), width: 2.0)),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return checkValidation(productDescription.text, 'description');
                    },
                  ),

                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton.icon(
                        color: Colors.redAccent,
                        label: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        ),
                        icon: Icon(Icons.navigate_next,color: Colors.white,size: 25.0,),
                        onPressed: () async {
                          //print(re.hasMatch(productName.text));
                          if (_formKey.currentState.validate()) {
                            if(category == 'category'){
                              Fluttertoast.showToast(
                                  msg: 'try to select a valid category please',
                                backgroundColor: Colors.red,
                                textColor: Colors.white
                              );
                            }else{
                              Navigator.pushNamed(context, '/addNext',arguments: {
                                'name':productName.text,
                                'price':productPrice.text,
                                'quantity':productQuantity.text,
                                'description':productDescription.text,
                                'category': category
                              });
                            }
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

  DropdownButton buildCategories() {
      List<DropdownMenuItem<String>> items =[];
      if(this.widget.cat.isNotEmpty){
        this.widget.cat.forEach((element) {
          items.add(
              DropdownMenuItem(
                child: Text('${element.categoryName}'),
                value: element.categoryName,
              )
          );
        });
      }else{
        print('there is no category to show');
      }
      DropdownButton menu = DropdownButton<String>(
        hint: Text('$category'),
        items: items,
        onChanged: (value){
          setState(() {
            category = value;
          });
        },
        //value: category,
      );
    //print(items.length);
    return menu;
  }

  String checkValidation(String text, String fieldName) {
    if(text.isEmpty){
      return 'The '+fieldName+' of the product is required';
    }else if(text.contains(" ")){
      return null;
    }else if(!re.hasMatch(text)){
      return 'Try to enter a valid '+fieldName+' please!';
    }
    return  null;
  }

  String checkFieldNumber(String price, String fieldName) {
      if(price.isEmpty){
        return 'The '+fieldName+' of the product is required';
      }else{
        return null;
      }
  }

  String nameLenght(String text, String fieldName) {
      if(text.length < 4 || text.length > 15){
        return 'the name must have min 5 characters and max 15 characters';
      }else{
        return null;
      }
  }

  Color getColor(int num) {
    switch(num){
      case 1 : return Colors.green; break;
      case 2 : return Colors.red; break;
      default: return Colors.white;
    }
  }

}
