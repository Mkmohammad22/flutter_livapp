import 'package:flutter/material.dart';
import 'package:flutter_livapp/screens/cart_screens.dart';
import 'package:flutter_livapp/screens/favorit_screens.dart';
import 'package:flutter_livapp/screens/home_Screens.dart';
import 'package:flutter_livapp/screens/login_screens.dart';
import 'package:flutter_livapp/screens/order_history_screens.dart';
import 'package:flutter_livapp/screens/order_screens.dart';
import 'package:flutter_livapp/screens/product_details_screens.dart';
import 'package:flutter_livapp/screens/register_screens.dart';
import 'package:flutter_livapp/state/cart_state.dart';
import 'package:flutter_livapp/state/product_state.dart';
import 'package:flutter_livapp/state/user_state.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductState()),
        ChangeNotifierProvider(create: (ctx) => UserState()),
        ChangeNotifierProvider(create: (ctx) => CartState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScrrens();
            }
            return HomeScreens();
          },
        ),
        routes: {
          HomeScreens.routeName: (ctx) => HomeScreens(),
          ProductDetailsScreens.routeName: (ctx) => ProductDetailsScreens(),
          FalvoritScreens.routeName: (ctx) => FalvoritScreens(),
          LoginScrrens.routeName: (ctx) => LoginScrrens(),
          RegisterScreens.routeName: (ctx) => RegisterScreens(),
          CartScreens.routeName: (ctx) => CartScreens(),
          OrderScreens.routeName: (ctx) => OrderScreens(),
          OrderNew.routeName: (ctx) => OrderNew(),
        },
      ),
    );
  }
}
