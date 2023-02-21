// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_livapp/state/product_state.dart';
// import 'package:localstorage/localstorage.dart';
// import '../lib/models/product1.dart';
// import 'package:http/http.dart' as http;

// Future<void> main() async {
// //  LocalStorage storage = new LocalStorage('usertoken');

//   String url = 'http://192.168.1.11:8000/api/products/';
//   // var token = storage.getItem('token');
//   try {
//     http.Response response = await http.get(Uri.parse(url), headers: {
//       'Authorization': "token fa34fb824845aa77ead82d7b2a9f24f84ba54422"
//     });
//     var data = json.decode(response.body) as List;
//     // print(data);
//     // List<Product> temp = [];
//     // for (var element in data) {
//     //   Product product = Product.fromJson(element);
//     //   temp.add(product);
//     // }

//     print(data);
//     return print("^_^");
//     ;
//   } catch (e) {
//     print("e getProducts");
//     print(e);
//     return print("-_-");
//     ;
//   }

// //   LocalStorage storage = new LocalStorage('usertoken');

// //   String? username;

// //   String? password;

// //     const String url = 'http://192.168.1.11:8000/api/login/';

// //     http.Response response = await http.post(Uri.parse(url),
// //         headers: {
// //           "Content-Type": "application/json",
// //         },
// //         body: json.encode({"username": "admin", "password": "qwasqwas1234"}));
// //     var data = json.decode(response.body) as Map;

// //     storage.setItem("token", data['token']);
// //     print(storage.getItem('token'));
// //     return print("il marche ^_^");
// }
