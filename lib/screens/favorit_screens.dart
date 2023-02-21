import 'package:flutter/material.dart';
import 'package:flutter_livapp/state/product_state.dart';
import 'package:flutter_livapp/widgets/add_drower.dart';
import 'package:flutter_livapp/widgets/singleProduct.dart';
import 'package:provider/provider.dart';

class FalvoritScreens extends StatelessWidget {
  static const routeName = '/favorit-screens';

  const FalvoritScreens({super.key});
  @override
  Widget build(BuildContext context) {
    final favorit = Provider.of<ProductState>(context).favorits;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorits"),
      ),
      drawer: AppDrower(),
      // drawer: AppDrower(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: favorit.length,
        itemBuilder: (ctx, i) => SingleProduct(
          id: favorit[i].id as int,
          title: favorit[i].title.toString(),
          image: favorit[i].image.toString(),
          favorit: favorit[i].favorit as bool,
        ),
      ),
    );
  }
}
