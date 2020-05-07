import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/pages/product_detail_page.dart';
import 'package:shoppingapp/providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailPage.routeName,
                arguments: loadedProduct.id);
          },
          child: Image.network(
            loadedProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, changedProduct, _) =>
                IconButton(
                  icon: Icon(
                    changedProduct.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color: Theme
                      .of(context)
                      .accentColor,
                  onPressed: changedProduct.toggleFavorite,
                ),
          ),
          title: Text(
            loadedProduct.title,
            textAlign: TextAlign.center,
          ),
          subtitle: Text('\$${loadedProduct.price}'),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
