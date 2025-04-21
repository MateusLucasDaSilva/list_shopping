import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';

class DialogAddProductWidget extends StatefulWidget {
  final Function(ProductEntity) addProduct;
  const DialogAddProductWidget({super.key, required this.addProduct});

  @override
  State<DialogAddProductWidget> createState() => _DialogAddProductWidgetState();
}

class _DialogAddProductWidgetState extends State<DialogAddProductWidget> {
  final TextEditingController productNameEC = TextEditingController();
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
              controller: productNameEC,
              validator: (String? value) {
                value = value?.trim();

                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final bool formValid = formKey.currentState?.validate() ?? false;
                if (!formValid) return;
                widget.addProduct(ProductEntity.empty(name: productNameEC.text));
                Navigator.pop(context);
              },
              child: const Text('Criar produto1`'),
            ),
          ],
        ),
      ),
    );
  }
}
