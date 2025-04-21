import '../../domain/entities/product_entity.dart';

class ProductsModel extends ProductEntity {
  ProductsModel({
    required super.id,
    required super.name,
    required super.price,
    required super.quantity,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      quantity: quantity,
    );
  }

  factory ProductsModel.fromEntity(ProductEntity entity) {
    return ProductsModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      quantity: entity.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
    );
  }
}
