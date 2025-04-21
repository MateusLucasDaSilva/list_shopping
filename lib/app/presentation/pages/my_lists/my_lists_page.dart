import 'package:flutter/material.dart';

import '../../../domain/entities/list_products_entity.dart';
import '../../../shared/dialogs/dialog_helper.dart';
import '../list/list_page.dart';
import 'controller/my_lists_controller.dart';

class MyListsPage extends StatefulWidget {
  const MyListsPage({super.key});

  @override
  State<MyListsPage> createState() => _MyListsPageState();
}

class _MyListsPageState extends State<MyListsPage> {
  final MyListsController controller = MyListsController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Minhas Listas'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => DialogHelper.showModalAddList(
            context,
            addList: controller.addList,
          ),
          child: const Icon(Icons.add),
        ),
        body: Builder(builder: (BuildContext context) {
          if (controller.lists.isEmpty) {
            return const Center(
              child: Text('Nenhuma lista criada'),
            );
          }

          return ListView.builder(
            itemCount: controller.lists.length,
            itemBuilder: (BuildContext context, int index) {
              final ListProductsEntity list = controller.lists[index];
              return ListTile(
                onLongPress: () => controller.removeList(list),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ListPage(list: list),
                  ),
                ),
                leading: Text(
                  list.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
