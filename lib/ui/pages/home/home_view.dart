import 'package:flutter/material.dart';
import 'package:flutter_storage/data/model/product_entity.dart';
import 'package:flutter_storage/ui/pages/add_product/add_product_view.dart';
import 'package:flutter_storage/ui/pages/home/home_bloc.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<HomeBloc>().updateProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ProductEntity>>(
        stream: context.read<HomeBloc>().productsStream,
        builder: (context, snapshot) {
          final products = snapshot.data;
          if (products == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) => ProductWidget(
              product: products[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAdd(context),
      ),
    );
  }

  void onAdd(BuildContext context) async {
    Navigator.of(context)
        .push(
      MaterialPageRoute(builder: (_) => const AddProductView()),
    )
        .then((product) {
      if (product != null) {
        context.read<HomeBloc>().insertProduct(product);
      }
    });
  }
}

class ProductWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.code),
                Text(product.name),
                Text(product.description),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().deleteProduct(product.code);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
