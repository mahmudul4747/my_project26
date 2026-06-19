import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project26/features/admin/data/models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> addProduct({
    required String name,
    required double price,
    required String category,
    required String imageUrl,
  }) async {
    await _firestore.collection('products').add({
      'name': name,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateProduct({
    required String id,
    required String name,
    required double price,
    required String category,
    required String imageUrl,
  }) async {
    await _firestore.collection('products').doc(id).update({
      'name': name,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
    });
  }

  Future<void> deleteProduct(String id) async {
    await _firestore.collection('products').doc(id).delete();
  }

  Stream<List<ProductModel>> getProducts() {
  return _firestore
      .collection('products')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map((doc) {
          return ProductModel.fromMap(
            doc.id,
            doc.data(),
          );
        }).toList(),
      );
}
}