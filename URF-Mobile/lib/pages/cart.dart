import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/cart.dart';
import 'package:firstapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.black.make(),
      ),
      body: Column(
        children: [
          _Cartlist().p32().expand(),
          const Divider(),
          const _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: const {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(MyTheme.darkBluishColor)
                  .bold
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () => {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()))
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(MyTheme.darkBluishColor),
            ),
            child: "Buy".text.make(),
          )
        ],
      ),
    );
  }
}

class _Cartlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                      //setState(() {});
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
