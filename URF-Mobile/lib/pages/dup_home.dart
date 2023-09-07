// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'dart:convert';

import 'package:firstapp/models/catalog.dart';
import 'package:firstapp/widgets/drawer.dart';
//import 'package:firstapp/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days = 30;

  final String name = "Rehan";
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    final catlogjson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeddata = jsonDecode(catlogjson);
    var products = decodeddata["products"];
    Catlog.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        // ignore: unnecessary_null_comparison
        child: (Catlog.items != null || Catlog.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                        header: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: Text(
                              Catlog.items[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        footer: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: Text(
                            Catlog.items[index].price.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        child: Image.network(Catlog.items[index].image)),
                  );
                },
                itemCount: Catlog.items.length,
              )

            // ? ListView.builder(
            //     itemCount: Catlog.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: Catlog.items[index],
            //       );
            //     },
            //   )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const mydrawer(),
    );
  }
}
