import 'package:flutter/material.dart';
import 'package:flutter_storage/data/model/product_entity.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(hintText: "Code"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: "Description"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onAdd,
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAdd() {
    final product = ProductEntity(
      code: _codeController.text,
      name: _nameController.text,
      description: _descriptionController.text,
    );
    Navigator.of(context).pop(product);
  }
}
