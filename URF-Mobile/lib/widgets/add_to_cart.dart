import 'package:firstapp/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firstapp/models/catalog.dart';
import 'package:firstapp/models/cart.dart';
import 'package:firstapp/widgets/themes.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  const AddtoCart(
    Key? key,
    this.catalog,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    // ignore: no_leading_underscores_for_local_identifiers

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluishColor,
          ),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
