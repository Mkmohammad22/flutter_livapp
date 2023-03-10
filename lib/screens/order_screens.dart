import 'package:flutter/material.dart';
import 'package:flutter_livapp/screens/cart_screens.dart';
import 'package:flutter_livapp/screens/order_history_screens.dart';
import 'package:flutter_livapp/state/cart_state.dart';
import 'package:provider/provider.dart';

class OrderNew extends StatefulWidget {
  static const routeName = '/order-now-screens';

  const OrderNew({super.key});
  @override
  _OrderNewState createState() => _OrderNewState();
}

class _OrderNewState extends State<OrderNew> {
  final _form = GlobalKey<FormState>();
  late final int id;

  String _email = '';
  String _phone = '';
  String _address = '';

  _orderNew() async {
    var isValid = !_form.currentState!.validate();
    if (isValid) {
      return;
    }
    _form.currentState!.save();
    final cart = Provider.of<CartState>(context, listen: false).cartModel;

    bool order = await Provider.of<CartState>(context, listen: true)
        .ordercart(id, _address, _email, _phone);
    if (order) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(OrderScreens.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Now"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Enter Your Email";
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _email = v!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Phone"),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Enter Your Phone Number";
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _phone = v!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Address"),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Enter Your Address";
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _address = v!;
                  },
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _orderNew();

                          // Navigator.of(context)
                          //     .pushNamed(OrderScreens.routeName);
                        },
                        child: const Text("Order")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(CartScreens.routeName);
                        },
                        child: const Text("Edit Cart")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
