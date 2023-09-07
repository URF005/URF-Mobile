import 'package:firstapp/core/store.dart';
import 'package:firstapp/pages/cart.dart';
import 'package:firstapp/pages/login_page.dart';
import 'package:firstapp/utils/routes.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      color: Colors.white,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: MyRoutes.login,
      routes: {
        MyRoutes.login: (context) => const Login(),
        MyRoutes.home: (context) => const Homepage(),
        MyRoutes.cart: (context) => const Cart(),
      },
    );
  }
}
