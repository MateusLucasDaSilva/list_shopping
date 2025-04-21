import '../../domain/entities/list_products_entity.dart';
import '../../domain/entities/product_entity.dart';
import 'products_model.dart';

class ListProductsModel extends ListProductsEntity {
  final List<ProductsModel> productsModel;

  ListProductsModel({
    required super.id,
    required super.name,
    required this.productsModel,
  }) : super(products: productsModel);

  ListProductsEntity toEntity() {
    return ListProductsEntity(
      id: id,
      name: name,
      products: productsModel.map(( ProductsModel product) => product).toList(),
    );
  }

  factory ListProductsModel.fromEntity(ListProductsEntity entity) {
    return ListProductsModel(
      id: entity.id,
      name: entity.name,
      productsModel: entity.products.map((ProductEntity product) => ProductsModel.fromEntity(product)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'products': productsModel.map((ProductsModel product) => product.toMap()).toList(),
    };
  }

  factory ListProductsModel.fromMap(Map<String, dynamic> map) {
    return ListProductsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      productsModel: List<ProductsModel>.from(
        (map['products'] as List<dynamic>).map(
          (dynamic productMap) => ProductsModel.fromMap(productMap as Map<String, dynamic>),
        ),
      ),
    );
  }
}
