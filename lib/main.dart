import 'package:catalog/core/store.dart';
import 'package:catalog/pages/cart_page.dart';
import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  // await Firebase.initializeApp();
  runApp(VxState(store:MyStore(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme:MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        routes:{
          "/":(context)=>LoginPage(),
          MyRoutes.loginRoute:(context)=>LoginPage(),
          MyRoutes.homeRoute:(context)=>HomePage(),
          MyRoutes.cartRoute:(context)=>CartPage(),
        }
    );
  }
}
