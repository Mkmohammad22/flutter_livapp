import 'package:flutter/material.dart';
import 'package:flutter_livapp/screens/home_Screens.dart';
import 'package:flutter_livapp/screens/order_screens.dart';
import 'package:flutter_livapp/state/cart_state.dart';
import 'package:provider/provider.dart';

class CartScreens extends StatelessWidget {
  static const routeName = '/cart-screens';

  const CartScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context).cartModel;
    if (cart == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("No Cart"),
        ),
        body: const Center(
          child: Text("No Card Found"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart Screens"),
          actions: [
            TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: Text(
                "${cart.cartproducts!.length}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total: ${cart.total}"),
                  Text("Date: ${cart.date}"),
                  ElevatedButton(
                    onPressed: cart.cartproducts!.isEmpty
                        ? null
                        : () {
                            Navigator.of(context).pushNamed(OrderNew.routeName);
                          },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text("Order"),
                  ),
                  ElevatedButton(
                      onPressed: cart.cartproducts!.isEmpty
                          ? null
                          : () async {
                              bool isdelete = await Provider.of<CartState>(
                                      context,
                                      listen: false)
                                  .deletecart(cart.id!);
                              if (isdelete) {
                                Navigator.of(context).pushReplacementNamed(
                                    HomeScreens.routeName);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 235, 10, 10),
                      ),
                      child: const Text("Delete"))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.cartproducts!.length,
                  itemBuilder: (ctx, i) {
                    var item = cart.cartproducts![i];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.product![0].title.toString()),
                                Text("Price : ${item.price}"),
                                Text("quantity : ${item.quantity}"),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Provider.of<CartState>(context, listen: false)
                                      .deletecartproduct(item.id!);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 212, 9, 9),
                                ),
                                child: const Text("Delete"))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
