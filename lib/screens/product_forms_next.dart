import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopss/models/product.dart';
import 'package:shopss/services/product_service.dart';
import 'package:shopss/services/user_service.dart';

class ProductFormNext extends StatefulWidget {
  @override
  _ProductFormNextState createState() => _ProductFormNextState();
}

class _ProductFormNextState extends State<ProductFormNext> {
  File _image1;
  File _image2;
  File _image3;
  String category = '';
  Map product = {};
  final UserService userService = UserService();
  final ProductService productService = ProductService();

  bool isChexSize1 = false;
  bool isChexSize2 = false;
  bool isChexSize3 = false;
  bool isChexSize4 = false;
  bool isChexSize5 = false;
  bool isChexSize6 = false;
  bool isChexSize7 = false;
  bool isChexSize8 = false;
  bool isChexSize35 = false;
  bool isChexSize37 = false;
  bool isChexSize39 = false;


  bool isChexColor1 = false;
  bool isChexColor2 = false;
  bool isChexColor3 = false;
  bool isChexColor4 = false;
  bool isChexColor5 = false;
  bool isChexColor6 = false;
  bool isChexColor7 = false;
  bool isChexColor8 = false;

  List<String> sizes = [];
  List<String> colors = [];

  Map size = {};
  Map color = {};



  Future getImage(int numb) async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        switch (numb) {
          case 1 :
            _image1 = pickedFile;
            break;
          case 2 :
            _image2 = pickedFile;
            break;
          case 3 :
            _image3 = pickedFile;
            break;
        }
      });
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor:Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),
        ),
        title: Text('Product Forms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 3.0),
                child: Text('Take three picture for your product'),
              ),
              Container(
                  height: 115.0,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlineButton(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 2.5),
                            onPressed: ()=>getImage(1),
                            child: displayChild1(),
                          ),
                        ),
                        Expanded(
                          child: new OutlineButton(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 2.5),
                            onPressed:()=>getImage(2),
                            child: displayChild2(),
                          ),
                        ),
                        Expanded(
                          child: new OutlineButton(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 2.5),
                            onPressed: ()=>getImage(3),
                            child: displayChild3(),
                          ),
                        ),

                      ],
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 3.0),
                child: Text('Available Colors'),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Red'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor1 = val;
                              if(isChexColor1){
                                colors.add('red');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor1,
                          activeColor: Colors.red,                        ),
                        Text('White'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor2 = val;
                              if(isChexColor2){
                                colors.add('white');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor2,
                          activeColor: Colors.red,                        ),
                        Text('Blue'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor3 = val;
                              if(isChexColor3){
                                colors.add('blue');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor3,
                          activeColor: Colors.red,
                        ),
                        Text('Yellow'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor4 = val;
                              if(isChexColor4){
                                colors.add('yellow');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor4,
                          activeColor: Colors.red,                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Grey'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor5 = val;
                              if(isChexColor5){
                                colors.add('grey');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor5,
                          activeColor: Colors.red,                        ),
                        Text('Brown'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor6 = val;
                              if(isChexColor6){
                                colors.add('brown');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor6,
                          activeColor: Colors.red,                        ),
                        Text('Green'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor7= val;
                              if(isChexColor7){
                                colors.add('green');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor7,
                          activeColor: Colors.red,                        ),
                        Text('Other'),
                        Checkbox(
                          onChanged: (val){
                            setState(() {
                              isChexColor8 = val;
                              if(isChexColor8){
                                colors.add('other');
                              }else{
                                colors.removeLast();
                              }
                            });
                          },
                          value: isChexColor8,
                          activeColor: Colors.red,                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                child: Text('Available Sizes'),
              ),
              Card(child: buildSizesAndOther(getCategoryProduct(product))),
              Container(
                width: double.infinity,
                child: RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                      'Validate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    onPressed: () async {
                      //await userService.addAdvertisement(product['name'], product['description'], _image2);
                        size = getSizes();
                        color = getColors();
                        if (_image1 != null && _image2 != null &&
                            _image3 != null) {
                          final Product prod = Product(
                              productName: product['name'],
                              productOldPrice: product['price'],
                              productNewPrice: product['price'],
                              productQtite: product['quantity'],
                              productPicture1: '',
                              productPicture2: '',
                              productPicture3: '',
                              productCategory: product['category'],
                              productDescription: product['description'],
                              sizes: size,
                              colors: color
                          );
                          final status = await productService.isRegistered(prod.productName);
                          //print(result);
                          if(!status){
                            final result = await productService.addProduct(
                                prod, _image1,_image2,_image3);
                            //print('\nresult :' +result.toString());
                            if (result == null) {

                              Fluttertoast.showToast(
                                  msg: 'Product added successfully!',
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white
                              );
                              Navigator.pushReplacementNamed(
                                  context, '/home');
                            }else{
                              Fluttertoast.showToast(
                                  msg: 'Product was not added so try again please !',
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white);
                            }
                          }else{
                            Fluttertoast.showToast(
                                msg: 'You already have this product so try to update from your account',
                                backgroundColor: Colors.green,
                                textColor: Colors.white);
                          }

                        } else {
                          Fluttertoast.showToast(
                              msg: 'Try to select a valid image',
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                        }
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget displayChild1() {
    if (_image1 != null) {
      return Image.file(_image1);
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Icon(
          Icons.add_a_photo,
          size: 50.0,
        ),
      );
    }
  }

  Widget displayChild2() {
    if (_image2 != null) {
      return Image.file(_image2);
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Icon(
          Icons.add_a_photo,
          size: 50.0,
        ),
      );
    }
  }

  Widget displayChild3() {
    if (_image3 != null) {
      return Image.file(_image3);
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Icon(
          Icons.add_a_photo,
          size: 50.0,
        ),
      );
    }
  }

  String getCategoryProduct(Map p){
    if(product['category'] == 'man pants' || product['category'] == 'woman pants'){
      return 'pants';
    }else if(product['category'] == 'man shirt' || product['category'] == 'woman shirt'){
      return 't-shirt';
    }else if(product['category'] == 'man shoes' || product['category'] == 'woman shoes'){
      return 'pants';
    }
    return product['category'];
  }
  Widget buildSizesAndOther(String category){
    switch(category){
      case 't-shirt':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('XXS'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize1 = val;
                      if(isChexSize1){
                        sizes.add('xxs');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize1,
                  activeColor: Colors.red,
                ),
                Text('XS'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize2 = val;
                      if(isChexSize2){
                        sizes.add('xs');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize2,
                  activeColor: Colors.red,
                ),
                Text('S'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize3 = val;
                      if(isChexSize3){
                        sizes.add('s');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize3,
                  activeColor: Colors.red,
                ),
                Text('M'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize4 = val;
                      if(isChexSize4){
                        sizes.add('m');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text('L'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize5 = val;
                      if(isChexSize5){
                        sizes.add('l');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize5,
                  activeColor: Colors.red,
                ),
                Text('XL'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize6 = val;
                      if(isChexSize6){
                        sizes.add('xl');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize6,
                  activeColor: Colors.red,
                ),
                Text('XXL'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize7 = val;
                      if(isChexSize7){
                        sizes.add('xxl');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize7,
                  activeColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize8 = val;
                      if(isChexSize8){
                        sizes.add('other');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize8,
                  checkColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      case 'pants':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('28'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize1 = val;
                      if(isChexSize1){
                        sizes.add('28');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize1,
                  activeColor: Colors.red,
                ),
                Text('30'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize2 = val;
                      if(isChexSize2){
                        sizes.add('30');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize2,
                  activeColor: Colors.red,
                ),
                Text('32'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize3 = val;
                      if(isChexSize3){
                        sizes.add('32');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize3,
                  activeColor: Colors.red,
                ),
                Text('34'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize4 = val;
                      if(isChexSize4){
                        sizes.add('34');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
                Text('35'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize35 = val;
                      if(isChexSize35){
                        sizes.add('35');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
                Text('37'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize37 = val;
                      if(isChexSize37){
                        sizes.add('37');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text('36'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize5 = val;
                      if(isChexSize5){
                        sizes.add('36');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize5,
                  activeColor: Colors.red,
                ),
                Text('38'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize6 = val;
                      if(isChexSize6){
                        sizes.add('38');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize6,
                  activeColor: Colors.red,
                ),
                Text('40'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize7 = val;
                      if(isChexSize7){
                        sizes.add('40');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize7,
                  activeColor: Colors.red,
                ),
                Text('39'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize39 = val;
                      if(isChexSize39){
                        sizes.add('39');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize8 = val;
                      if(isChexSize8){
                        sizes.add('other');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize8,
                  activeColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      case 'laptop':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('i3'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize1 = val;
                      if(isChexSize1){
                        sizes.add('i3');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize1,
                  activeColor: Colors.red,
                ),
                Text('i5'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize2 = val;
                      if(isChexSize2){
                        sizes.add('i5');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize2,
                  activeColor: Colors.red,
                ),
                Text('i7'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize3 = val;
                      if(isChexSize3){
                        sizes.add('i7');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize3,
                  activeColor: Colors.red,
                ),
                Text('other'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize4 = val;
                      if(isChexSize4){
                        sizes.add('other');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
              ],
            ),
            ]
        ); break;
      case 'smartphone':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('S5'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize1 = val;
                      if(isChexSize1){
                        sizes.add('S5');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize1,
                  activeColor: Colors.red,
                ),
                Text('S6'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize2 = val;
                      if(isChexSize2){
                        sizes.add('S6');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize2,
                  activeColor: Colors.red,
                ),
                Text('S7'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize3 = val;
                      if(isChexSize3){
                        sizes.add('S7');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize3,
                  activeColor: Colors.red,
                ),
                Text('S8'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize4 = val;
                      if(isChexSize4){
                        sizes.add('S8');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize4,
                  activeColor: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text('Y6'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize5 = val;
                      if(isChexSize5){
                        sizes.add('Y6');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize5,
                  activeColor: Colors.red,
                ),
                Text('Y7'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize6 = val;
                      if(isChexSize6){
                        sizes.add('Y7');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize6,
                  activeColor: Colors.red,
                ),
                Text('Y8'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize7 = val;
                      if(isChexSize7){
                        sizes.add('Y8');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize7,
                  activeColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){
                    setState(() {
                      isChexSize8 = val;
                      if(isChexSize8){
                        sizes.add('other');
                      }else{
                        sizes.removeLast();
                      }
                    });
                  },
                  value: isChexSize8,
                  activeColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      case 'iphone':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('6'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('7'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('8'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('9'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text('10'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('11'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('12'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      case 'iphone':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('6'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('7'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('8'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('9'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text('10'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('11'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('12'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      case 'huawei':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Y5'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Y6'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Y7'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Y8'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text('S5'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('S6'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('S7'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      case 'autre smartphone':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('XXl'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Xl'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('M'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('MS'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Grey'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Brown'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Green'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
                Text('Other'),
                Checkbox(
                  onChanged: (val){

                  },
                  value: false,
                  checkColor: Colors.red,
                ),
              ],
            )
          ],
        ); break;
      default: return null ; break;
    }
  }

  Map getSizes(){
    Map map = {};
    sizes.forEach((element) {
      map[element] = element;
    });
    return map;
  }

  Map getColors(){
    Map map = {};
    colors.forEach((element) {
      map[element] = element;
    });
    return map;
  }

}


