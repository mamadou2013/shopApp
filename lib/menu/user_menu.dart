import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopss/models/category.dart';
import 'package:shopss/models/seller.dart';
import 'package:shopss/models/user.dart';
import 'package:shopss/screens/authentication.dart';
import 'package:shopss/screens/not_found.dart';
import 'package:shopss/screens/product_forms.dart';
import 'package:shopss/screens/product_sell.dart';
import 'package:shopss/services/product_service.dart';
import 'package:shopss/services/user_service.dart';
import 'package:shopss/services/category_service.dart';



class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final UserService userService = UserService();
  final CategoryService categoryService = CategoryService();
  final ProductService productService = ProductService();


  @override
  Widget build(BuildContext context) {
    final Partner partner = Provider.of<Partner>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('${partner.username}'),
            accountEmail: Text('${partner.email}'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Text('${partner.username.characters.first.toUpperCase()}',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),)
              ),
            ),
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add, color: Colors.redAccent,),
            title: Text('Add Product'),
            onTap: () async{
              List<Category> cat = await categoryService.getCategories();
              if(cat.length != null){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>ProductForm(cat: cat)
                ));
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money,color: Colors.redAccent),
            title: Text('Sales'),
            onTap: () async {
                List<Seller> sell = await productService.getProductSell();
                if(sell.length != null){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MySell(sell))
                  );
                }else{
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=>NotFoundScreen(name: 'Sales',)
                  ));
                }
            },
          ),
          ListTile(
            leading: Icon(Icons.share,color: Colors.redAccent),
            title: Text('Products Share'),
            onTap: (){
                Navigator.pushReplacementNamed(context, ('/myProduct'));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.redAccent),
            title: Text('Settings'),
            onTap: () async{
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.wifi_lock,color: Colors.redAccent),
            title: Text('Log Out'),
            onTap: () async {
              final authService = Provider.of<UserService>(context,listen: false);
              await authService.logoutUser();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Authentication()
              ));
            },
          ),
        ],
      ),
    );
  }
}

