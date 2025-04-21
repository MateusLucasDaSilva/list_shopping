import 'package:list_shopping/app/domain/entities/either_of/either_of.dart';
import 'package:list_shopping/app/domain/entities/failure/failure.dart';
import 'package:list_shopping/app/domain/entities/list_products_entity.dart';
import 'package:list_shopping/app/domain/entities/product_entity.dart';

abstract class ListProductsRepository {
  Future<EitherOf<Failure, VoidSuccess>> create({required ListProductsEntity list});
  Future<EitherOf<Failure, VoidSuccess>> delete({required ListProductsEntity list});
  Future<EitherOf<Failure, VoidSuccess>> update({required ListProductsEntity list});
  Future<EitherOf<Failure, VoidSuccess>> addProduct({required ProductEntity product, required String listId});
  Future<EitherOf<Failure, VoidSuccess>> removeProduct({required ProductEntity product, required String listId});
  Future<EitherOf<Failure, VoidSuccess>> updateProduct({required ProductEntity product, required String listId});
}
