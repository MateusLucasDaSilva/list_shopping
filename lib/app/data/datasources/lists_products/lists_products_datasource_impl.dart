import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/constantes/constantes_collection_name.dart';
import '../../../domain/entities/either_of/either_of.dart';
import '../../../domain/entities/list_products_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../models/list_products_model.dart';
import '../../models/products_model.dart';
import './lists_products_datasource.dart';

class ListsProductsDatasourceImpl extends ListsProductsDatasource {
  final FirebaseFirestore _firebase;

  ListsProductsDatasourceImpl({required FirebaseFirestore firebase}) : _firebase = firebase;

  @override
  Future<VoidSuccess> addProduct({required ProductEntity product, required String listId}) async {
    try {
      final Map<String, dynamic> data = ProductsModel.fromEntity(product).toMap();
      await _productDocumentRef(listId: listId, productId: product.id).set(data);
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VoidSuccess> create({required ListProductsEntity list}) async {
    try {
      final Map<String, dynamic> data = ListProductsModel.fromEntity(list).toMap();
      await _listDocumentRef(list.id).set(data);
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VoidSuccess> delete({required ListProductsEntity list}) async {
    try {
      await _listDocumentRef(list.id).delete();
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VoidSuccess> removeProduct({required ProductEntity product, required String listId}) async {
    try {
      await _productDocumentRef(listId: listId, productId: product.id).delete();
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VoidSuccess> update({required ListProductsEntity list}) async {
    try {
      final Map<String, dynamic> data = ListProductsModel.fromEntity(list).toMap();
      await _listDocumentRef(list.id).update(data);
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<VoidSuccess> updateProduct({required ProductEntity product, required String listId}) async {
    try {
      final Map<String, dynamic> data = ProductsModel.fromEntity(product).toMap();

      await _productDocumentRef(listId: listId, productId: product.id).update(data);
      return const VoidSuccess();
    } catch (error) {
      rethrow;
    }
  }

  DocumentReference<Map<String, dynamic>> _productDocumentRef({required String listId, required String productId}) => _listDocumentRef(listId).collection(ConstantesCollectionName.products).doc(productId);

  DocumentReference<Map<String, dynamic>> _listDocumentRef(String listId) => _firebase
      .collection(
        ConstantesCollectionName.myLists,
      )
      .doc(listId);
}
