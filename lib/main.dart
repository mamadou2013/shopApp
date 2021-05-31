import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopss/screens/add_category.dart';
import 'package:shopss/screens/authentication.dart';
import 'package:shopss/screens/my_home.dart';
import 'package:shopss/screens/my_products.dart';
import 'package:shopss/screens/product_forms.dart';
import 'package:shopss/screens/product_forms_next.dart';
import 'package:shopss/screens/settings.dart';
import 'package:shopss/screens/sign_in.dart';
import 'package:shopss/screens/sign_up.dart';
import 'package:shopss/screens/update_product.dart';
import 'package:shopss/services/product_service.dart';
import 'package:shopss/services/user_service.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAppRoot());
}

class MyAppRoot extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService();
    final ProductService productService = ProductService();
    return MultiProvider(
      providers: [
        Provider<UserService>(create: (_)=>UserService()),
        FutureProvider(create: (_)=>userService.getCurrentUser()),
        StreamProvider(create: (_)=>productService.getProducts())
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ],
            background: Container()),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Authentication(),
          '/login': (context) => SignIn(),
          '/home': (context) => MyHome(),
          '/register': (context) => SignUp(),
          '/add': (context) => ProductForm(),
          '/myProduct': (context) => MyProduct(),
          '/updateProd': (context) => UpdateProduct(),
          '/addNext':(context) => ProductFormNext(),
          '/addCategory':(context)=>AddCategory(),
          '/settings':(context)=> Setting(),
        },
      ),
    );
  }
}
