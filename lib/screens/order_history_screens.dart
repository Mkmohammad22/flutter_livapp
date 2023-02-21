import 'package:flutter/material.dart';
import 'package:flutter_livapp/state/cart_state.dart';
import 'package:flutter_livapp/widgets/add_drower.dart';
import 'package:provider/provider.dart';

class OrderScreens extends StatelessWidget {
  static const routeName = '/order-screens';

  const OrderScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartState>(context).oldorder;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Old Orders"),
      ),
      drawer: AppDrower(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(data[i].email.toString()),
                    Text(data[i].phone.toString()),
                    Text(data[i].address.toString()),
                    Text("Total : ${data[i].cart!.total as int}"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
