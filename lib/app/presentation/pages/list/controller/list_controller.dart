import 'package:flutter/material.dart';

import '../../../../domain/entities/list_products_entity.dart';
import '../../../../domain/entities/product_entity.dart';

class ListController extends ChangeNotifier {
  final ListProductsEntity list;
  ListController({
    required this.list,
  });

  void addProduct(ProductEntity product){
    list.products.add(product);
    notifyListeners();
  }

  void changeIsPurchased(ProductEntity product, bool value) {
    final int index = list.products.indexOf(product);
    if (index != -1) {
      list.products[index] = product.copyWith(isPurchased: value);
      notifyListeners();
    }
  }
}
