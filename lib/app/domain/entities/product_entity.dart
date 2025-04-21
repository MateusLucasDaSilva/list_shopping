

class ProductEntity {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final bool isPurchased;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.isPurchased = false,
  });

  factory ProductEntity.empty({
    required String name,
  }) {
    return ProductEntity(
      id: DateTime.now().toString(),
      name: name,
      price: 0,
      quantity: 1,
    );
  }

  String get priceFormatted => 'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';

  ProductEntity copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    bool? isPurchased,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isPurchased: isPurchased ?? this.isPurchased,
    );
  }
}
