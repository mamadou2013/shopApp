
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopss/models/product.dart';
import 'package:shopss/models/seller.dart';
import 'package:shopss/services/user_service.dart';


class MySell extends StatelessWidget {

  final UserService userService = UserService();
  final List<Seller> sellers;

  MySell(this.sellers);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = Provider.of<List<Product>>(context);
    List<Product> prod = getProductsOrders(products);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          leading: IconButton(
            onPressed:() {Navigator.pushReplacementNamed(context, '/home');},
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text('List of your sales'),
          centerTitle: true,
        ),
        body: (prod == null) ? Center(child: CircularProgressIndicator())
            :Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: ListView.builder(
                itemCount: prod.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.network('${prod[index].productPicture2}'),
                      ),
                      title: Row(
                        children: [
                          Expanded(child: Text('${prod[index].productName}')),
                          Expanded(child: new Text('${this.sellers[index].orderDate}'))
                        ],
                      ),
                      trailing: Text('${this.sellers[index].quantity}',style: (
                          TextStyle(fontWeight: FontWeight.bold)
                      ),),
                      onTap: (){
                      },
                    ),
                  );
                },
              ),
            )
        )
    );
  }

  List<Product> getProductsOrders(List<Product> prod) {
    List<Product> products =[];
    for(int i = 0; i < this.sellers.length; i++){
      for(int j = 0; j < prod.length; j++){
        if(this.sellers[i].productId == prod[j].productId){
          products.add(prod[j]);
          break;
        }
      }
    }
    return products;
  }
}
