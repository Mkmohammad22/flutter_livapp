import 'package:flutter/material.dart';
import 'package:flutter_livapp/screens/cart_screens.dart';
import 'package:flutter_livapp/state/cart_state.dart';
import 'package:flutter_livapp/state/product_state.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreens extends StatelessWidget {
  static const routeName = '/product-details-screens';

  const ProductDetailsScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final product = Provider.of<ProductState>(context).singleProduct(id as int);
    final cart = Provider.of<CartState>(context).cartModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreens.routeName);
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            label: Text(
              cart != null ? "${cart.cartproducts!.length}" : '',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.network(
              // http://192.168.1.11:8000/products/

              "https://livraisonapp.pythonanywhere.com${product.image}",
              fit: BoxFit.cover,
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title!,
                        style: TextStyle(color: Colors.blue, fontSize: 25)),
                    Text(
                      "Market Price : \$ ${product.marcketPrice}",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          backgroundColor: Colors.blue),
                    ),
                    Text(
                      "selling Price : \$ ${product.sellingPrice}",
                      style: const TextStyle(
                          fontSize: 14,
                          backgroundColor: Color.fromARGB(255, 243, 187, 33)),
                    ),
                  ],
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Color.fromARGB(255, 213, 226, 25),
                  ),
                  onPressed: () {
                    Provider.of<CartState>(context, listen: false)
                        .addtoCart(id);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 69, 118, 224),
                  ),
                  label: const Text(
                    "Add To Card",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 177, 40),
                    ),
                  ),
                ),
              ],
            ),
            Text(product.description!)
          ],
        ),
      ),
    );
  }
}
