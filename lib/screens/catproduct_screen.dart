import 'package:flutter/material.dart';
import 'package:untitled3/provider/api_provider.dart';
import 'package:untitled3/provider/models/Product_model.dart';
import 'package:untitled3/provider/models/catproduct_model.dart';


class CatproductScreen extends StatefulWidget {
  final String category;

  const CatproductScreen({super.key, required this.category});

  @override
  State<CatproductScreen> createState() => _CatproductScreenState();
}

class _CatproductScreenState extends State<CatproductScreen> {
  List<Product> products = [];
  bool isLoading = true;

  Future<void> getProducts() async {
    CatProguct? response = await CatProductApi().getProductsByCategory(widget.category);
    setState(() {
      if (response != null) {
        products = response.products ?? [];
      }
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${widget.category}'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : products.isEmpty
          ? Center(child: Text('No products available.'))
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.thumbnail ?? ''),
            title: Text(product.title ?? ''),
            trailing:Text('Price: \$${product.price ?? 0}'
            ),
          );
        },
      ),
    );
  }
}
