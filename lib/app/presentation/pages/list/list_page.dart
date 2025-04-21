import 'package:flutter/material.dart';

import '../../../domain/entities/list_products_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../shared/dialogs/dialog_helper.dart';
import 'controller/list_controller.dart';

class ListPage extends StatefulWidget {
  final ListProductsEntity list;
  const ListPage({
    super.key,
    required this.list,
  });

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late ListController controller;

  @override
  void initState() {
    super.initState();
    controller = ListController(
      list: widget.list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, _) => Scaffold(
        appBar: AppBar(
          title: Text(widget.list.name),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>DialogHelper.showModalAddProduct(context, addProduct: controller.addProduct),
          child: const Icon(Icons.add),
        ),
        body: Builder(
          builder: (BuildContext context) {
            if(widget.list.products.isEmpty) {
              return const Center(
                child: Text('Nenhum produto adicionado'),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: controller.list.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final ProductEntity product = controller.list.products[index];
                  return ListTile(
                    
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        decoration: product.isPurchased ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: Text(
                      product.priceFormatted,
                      style: Theme.of(context).textTheme.bodyMedium,
                      
                    ),
                    leading: Checkbox(
                      visualDensity: VisualDensity.compact,
                      value: product.isPurchased,
                      onChanged: (bool? value) => controller.changeIsPurchased(product, value ?? false),
                    ),
                  );
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
