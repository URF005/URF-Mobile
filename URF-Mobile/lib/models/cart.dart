// ignore_for_file: unnecessary_null_comparison

import 'package:firstapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  // catalog field
  late Catlog _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  Catlog get catalog => _catalog;

  set catalog(Catlog newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
