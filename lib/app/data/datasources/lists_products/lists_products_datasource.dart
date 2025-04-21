import '../../../domain/entities/either_of/either_of.dart';
import '../../../domain/entities/list_products_entity.dart';
import '../../../domain/entities/product_entity.dart';

abstract class ListsProductsDatasource {
  Future<VoidSuccess> create({required ListProductsEntity list});
  Future<VoidSuccess> delete({required ListProductsEntity list});
  Future<VoidSuccess> update({required ListProductsEntity list});
  Future<VoidSuccess> addProduct({required ProductEntity product, required String listId});
  Future<VoidSuccess> removeProduct({required ProductEntity product, required String listId});
  Future<VoidSuccess> updateProduct({required ProductEntity product, required String listId});
}
