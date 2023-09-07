import 'package:firstapp/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firstapp/models/catalog.dart';
import 'package:firstapp/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddtoCart(key, catalog)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: MyTheme.creamColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.xl3
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .bold
                          .make(),
                      10.heightBox,
                      "Dolore lorem lorem amet stet lorem elitr no et lorem dolor. Et et eos stet lorem diam, duohhd dolores voluptua diam ipsum, justo kasd dolor vero magna elitr tempor rebum labore, sea ett amet lorem rebum sanctus. Ea dolor consetetu ipsum vero sed. Et kasd gubergren no takimata aliquyam sanctus."
                          .text
                          .textStyle(context.captionStyle)
                          .bold
                          .center
                          .make()
                          .p12(),
                    ],
                  ).py64(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
