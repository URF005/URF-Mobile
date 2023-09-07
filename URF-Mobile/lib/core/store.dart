// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firstapp/models/cart.dart';
import 'package:firstapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late Catlog catalog;
  late CartModel cart;

  MyStore() {
    catalog = Catlog();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
