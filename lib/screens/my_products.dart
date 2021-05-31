import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopss/models/product.dart';
import 'package:shopss/services/user_service.dart';

class MyProduct extends StatelessWidget {

  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        leading: IconButton(
          onPressed:() {Navigator.pushReplacementNamed(context, '/home');},
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text('List of products'),
        centerTitle: true,
      ),
      body: (products == null) ? Center(child: CircularProgressIndicator())
          :Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.grey[200],
            width: double.infinity,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network('${products[index].productPicture2}'),
                    ),
                    title: Text('${products[index].productName}'),
                    trailing: Text('${products[index].productQtite}',style: (
                    TextStyle(fontWeight: FontWeight.bold)
                    ),),
                    onTap: (){
                      Navigator.pushReplacementNamed(context, '/updateProd', arguments: {
                        'name':products[index].productName,
                        'price':products[index].productOldPrice,
                        'quantity':products[index].productQtite,
                        'picture':products[index].productPicture2,
                        'description':products[index].productDescription
                      });
                    },
                  ),
                );
              },
            ),
          )
      )
    );
  }
}
