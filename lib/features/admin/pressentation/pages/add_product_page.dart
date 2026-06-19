import 'package:flutter/material.dart';
import '../../data/services/product_service.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() =>
      _AddProductPageState();
}

class _AddProductPageState
    extends State<AddProductPage> {
  final service = ProductService();

  final nameController =
      TextEditingController();

  final priceController =
      TextEditingController();

  final categoryController =
      TextEditingController();

  Future<void> saveProduct() async {
    await service.addProduct(
      name: nameController.text,
      price: double.parse(
        priceController.text,
      ),
      category: categoryController.text,
      imageUrl: '',
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(
                labelText: 'Name',
              ),
            ),

            TextField(
              controller: priceController,
              keyboardType:
                  TextInputType.number,
              decoration:
                  const InputDecoration(
                labelText: 'Price',
              ),
            ),

            TextField(
              controller:
                  categoryController,
              decoration:
                  const InputDecoration(
                labelText: 'Category',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveProduct,
              child:
                  const Text("Save Product"),
            )
          ],
        ),
      ),
    );
  }
}