import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/products_provider.dart';

import './product_item.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  const ProductsGrid({Key key, this.showOnlyFavorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final List<Product> loadedProducts =
    showOnlyFavorites ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          child: ProductItem(),
          value: loadedProducts[index],
        );
      },
      itemCount: loadedProducts.length,
    );
  }
}
