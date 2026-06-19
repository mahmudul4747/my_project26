import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final _db = FirebaseFirestore.instance;

  final String collection = "products";

  Future<void> addProduct(ProductModel product) async {
    await _db.collection(collection).add({
      "name": product.name,
      "price": product.price,
      "discount": product.discount,
      "category": product.category,
      "imageUrl": product.imageUrl,
    });
  }

  Stream<List<ProductModel>> getProducts() {
    return _db.collection(collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return ProductModel(
          id: doc.id,
          name: data["name"],
          price: (data["price"] as num).toDouble(),
          discount: (data["discount"] as num).toDouble(),
          category: data["category"],
          imageUrl: data["imageUrl"],
        );
      }).toList();
    });
  }
}