import '../../../domain/entities/either_of/either_of.dart';
import '../../../domain/entities/product_entity.dart';

abstract class ProductDatasource {
  Future<VoidSuccess> create({required ProductEntity product});
  Future<VoidSuccess> delete({required ProductEntity product});
  Future<VoidSuccess> update({required ProductEntity product});
}
