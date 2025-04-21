import 'package:flutter/material.dart';

import '../../domain/entities/list_products_entity.dart';

class DialogAddListWidget extends StatefulWidget {
  final Function(ListProductsEntity) addList;
  const DialogAddListWidget({
    super.key,
    required this.addList,
  });

  @override
  State<DialogAddListWidget> createState() => _DialogAddListWidgetState();
}

class _DialogAddListWidgetState extends State<DialogAddListWidget> {
  final TextEditingController listNameEC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: listNameEC,
              validator: (String? value) {
                value = value?.trim();

                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nome da lista',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final bool formValid = formKey.currentState?.validate() ?? false;
                if (!formValid) return;
                widget.addList(ListProductsEntity.empty(name: listNameEC.text)
                );
                Navigator.pop(context);
              },
              child: const Text('Criar lista'),
            ),
          ],
        ),
      ),
    );
  }
}
