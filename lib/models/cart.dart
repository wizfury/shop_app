import 'package:shop_app/models/catalog.dart';
import 'dart:convert';

class CartModel {
  late catalogModel _catalog;

  final List<int> _itemIds = [];

  catalogModel get catalog => _catalog;

  set catalog(catalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(int.parse(item.id));
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
