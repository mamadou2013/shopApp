import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopss/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);
    return Container(
      height: 800.0,
      child: (products == null) ? Center(child: CircularProgressIndicator())
          : GridView.builder(
          itemCount: products.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
                child: Material(
                  child: InkWell(
                    onTap: () {
                    },
                    child: GridTile(
                        child: ListTile(
                          title:Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: Colors.pink,
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${products[index].productName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('Quantity:',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,),),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('${products[index].productQtite}',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 30.0),),),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text('Price:',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('\$${products[index].productNewPrice}',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                  ),
                                ],
                              ),
                              Expanded(child: Stack(
                                children: <Widget>[
                                  Center(child: CircularProgressIndicator()),
                                  FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: '${products[index].productPicture2}',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),)
                            ],
                          ),

                        )

                    ),
                  ),
                ));
          }),
    );
  }
}
