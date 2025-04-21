import 'package:flutter/material.dart';

import '../../domain/entities/list_products_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../widgets/dialog_add_list_widget.dart';
import '../widgets/dialog_add_product_widget.dart';

class DialogHelper {
  static Future<void> showModalAddList(
    BuildContext context, {
    required Function(ListProductsEntity) addList,
  }) async {
    return showModalBottomSheet(
      context: context,
      builder: (_) => DialogAddListWidget(
        addList: addList,
      ),
    );
  }

  static Future<void> showModalAddProduct(
    BuildContext context, {
    required Function(ProductEntity) addProduct,
  }) async {
    return showModalBottomSheet(
      context: context,
      builder: (_) => DialogAddProductWidget(
        addProduct: addProduct,
      ),
    );
  }
}
