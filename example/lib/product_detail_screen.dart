import 'package:flutter/material.dart';
import 'package:medusa_demo/main.dart';
import 'package:medusa_flutter/medusa_flutter.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isItemAlreadyInCart =
      false; //this is only for example purpose, need to fetch this from cartId

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: _isItemAlreadyInCart
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _addProductInCart,
                child: Text("Add to Cart"),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.product.thumbnail != null)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.product.thumbnail!,
                      width: 400,
                      height: 200,
                      errorBuilder: (context, error, stack) =>
                          const Icon(Icons.warning_amber_outlined),
                    ),
                  ],
                ),
              ),
            Text(
              widget.product.title!,
              style: Theme.of(context).textTheme.headline6,
            ),
            if (widget.product.subtitle != null)
              Text(
                widget.product.subtitle!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.product.variants != null
                  ? (widget.product.variants![0].prices != null
                      ? "${widget.product.variants![0].prices![0].currency?.symbol ?? "\$"} ${widget.product.variants![0].prices![0].amount.toString()}"
                      : "-")
                  : "-",
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _addProductInCart() async {
    try {
      SnackBar addCartProgress = SnackBar(
          content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Text("Adding item into cart")
        ],
      ));
      ScaffoldMessenger.of(context).showSnackBar(addCartProgress);
      StoreRegionsListRes? regionRes = await medusa.regions.list();
      if (regionRes != null) {
        StoreCartsRes? result = await medusa.carts.create(
            req: StorePostCartReq(items: [
          Item(variantId: widget.product.variants?[0].id, quantity: 1)
        ], regionId: regionRes.regions?.first.id));

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (result != null) {
          _isItemAlreadyInCart = true;
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Item added to cart"),
            duration: Duration(seconds: 3),
          ));
        } else {
          throw "Something went wrong!";
        }
      } else {
        throw "Region not exists";
      }
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Something went wrong!"),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
