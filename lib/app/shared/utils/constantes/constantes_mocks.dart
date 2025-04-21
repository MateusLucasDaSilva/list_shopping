import '../../../domain/entities/list_products_entity.dart';
import '../../../domain/entities/product_entity.dart';

class ConstantesMocks {
  static List<ListProductsEntity> mockShoppingLists = List<ListProductsEntity>.generate(20, (int index) {
    return ListProductsEntity(
      id: 'list_$index',
      name: 'Compras de ${_getMonthName(index)}',
      createdAt: DateTime.now().subtract(Duration(days: index * 30)),
      products: List<ProductEntity>.generate(10, (int productIndex) {
        return ProductEntity(
          id: 'prod_${index}_$productIndex',
          name: _mockProductNames[productIndex % _mockProductNames.length],
          price: (5 + (productIndex * 2)).toDouble(), // Preço variando de 5 a 23
          quantity: 1 + (productIndex % 5), // Quantidade de 1 a 5
          isPurchased: productIndex % 3 == 0, // Alguns produtos já comprados
        );
      }),
    );
  });

  static String _getMonthName(int index) {
    final List<String> months = <String>['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
    return months[index % 12];
  }

  static final List<String> _mockProductNames = <String>['Arroz', 'Feijão', 'Macarrão', 'Leite', 'Óleo', 'Açúcar', 'Sal', 'Farinha', 'Café', 'Bolacha', 'Manteiga', 'Presunto', 'Queijo', 'Detergente', 'Sabonete', 'Papel Higiênico', 'Shampoo', 'Desodorante', 'Batata', 'Cenoura'];
}
