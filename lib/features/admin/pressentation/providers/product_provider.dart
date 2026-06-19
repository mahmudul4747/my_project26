import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project26/features/admin/data/models/product_model.dart';
import 'package:my_project26/features/admin/data/services/product_service.dart';


final productServiceProvider = Provider((ref) => ProductService());

final productProvider = StreamProvider<List<ProductModel>>((ref) {
  final service = ref.read(productServiceProvider);
  return service.getProducts();
});