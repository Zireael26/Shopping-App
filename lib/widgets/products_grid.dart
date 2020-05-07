import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/products_provider.dart';

import './product_item.dart';
import '../models/product.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final List<Product> loadedProducts = productsData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          id: loadedProducts[index].id,
          title: loadedProducts[index].title,
          description: loadedProducts[index].description,
          imageUrl: loadedProducts[index].imageUrl,
        );
      },
      itemCount: loadedProducts.length,
    );
  }
}
