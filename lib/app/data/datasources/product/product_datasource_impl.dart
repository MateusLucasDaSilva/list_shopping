import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/constantes/constantes_collection_name.dart';
import '../../../domain/entities/either_of/either_of.dart';
import '../../../domain/entities/product_entity.dart';
import '../../models/products_model.dart';
import './product_datasource.dart';

class ProductDatasourceImpl extends ProductDatasource {
  final FirebaseFirestore _firebase;

  ProductDatasourceImpl({required FirebaseFirestore firebase}) : _firebase = firebase;

  @override
  Future<VoidSuccess> create({required ProductEntity product}) async {
    final Map<String, dynamic> data = ProductsModel.fromEntity(product).toMap();
    await _productDocumentRef(product.id).set(data);
    return const VoidSuccess();
  }

  @override
  Future<VoidSuccess> delete({required ProductEntity product}) async {
    await _productDocumentRef(product.id).delete();
    return const VoidSuccess();
  }

  @override
  Future<VoidSuccess> update({required ProductEntity product}) async {
    final Map<String, dynamic> data = ProductsModel.fromEntity(product).toMap();
    await _productDocumentRef(product.id).update(data);
    return const VoidSuccess();
  }

  DocumentReference<Map<String, dynamic>> _productDocumentRef(String productId) => _firebase
      .collection(
        ConstantesCollectionName.products,
      )
      .doc(productId);
}
