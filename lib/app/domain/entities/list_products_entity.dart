import 'product_entity.dart';

class ListProductsEntity {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<ProductEntity> products;

  ListProductsEntity({
    required this.id,
    required this.name,
    required this.products,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ListProductsEntity.empty({required String name}) => ListProductsEntity(
        name: name,
        id: DateTime.now().toString(),
        products: <ProductEntity>[],
      );

  double get totalPrice => products.fold<double>(0, (double value, ProductEntity product) => value + (product.price * product.quantity));

  ListProductsEntity copyWith({
    String? id,
    String? name,
    List<ProductEntity>? products,
    DateTime? createdAt,
  }) {
    return ListProductsEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
