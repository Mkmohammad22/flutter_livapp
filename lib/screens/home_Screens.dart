import 'package:flutter/material.dart';
import 'package:flutter_livapp/screens/cart_screens.dart';
import 'package:flutter_livapp/state/cart_state.dart';
import 'package:flutter_livapp/state/product_state.dart';
import 'package:flutter_livapp/widgets/add_drower.dart';
import 'package:flutter_livapp/widgets/singleProduct.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  static const routeName = '/home-screens';

  const HomeScreens({super.key});

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<CartState>(context).getCartDatas();
      Provider.of<CartState>(context).getoldOrders();
      _isLoding = await Provider.of<ProductState>(context).getProducts();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).poducts;
    if (!_isLoding) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("LivraisonAPP"),
        ),
        body: const Center(
          child: Text("Somthing is Wrong Try Again!"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("LivraisonAPP"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreens.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        drawer: AppDrower(),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: product.length,
          itemBuilder: (ctx, i) => SingleProduct(
            id: product[i].id as int, 
            title: product[i].title,
            image: product[i].image,
            favorit: product[i].favorit as bool,
          ),
        ),
      );
    }
  }
}
