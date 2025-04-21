import 'package:flutter/material.dart';

import '../../../../domain/entities/list_products_entity.dart';

class MyListsController extends ChangeNotifier {
  final List<ListProductsEntity> lists = <ListProductsEntity>[];

  void addList(ListProductsEntity list) {
    lists.add(list);
    notifyListeners();
  }

  void removeList(ListProductsEntity list) {
    lists.remove(list);
    notifyListeners();
  }
}
